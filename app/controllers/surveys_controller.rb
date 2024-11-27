class SurveysController < ApplicationController
  def new
    @survey = Survey.new(code: params[:code]) # Inicializa a pesquisa com o código fornecido
    @questions = Question.all # Carrega todas as perguntas
    @censo_questions = Question.where(category: 'Censo')

    # Cria as respostas relacionadas às perguntas
    @questions.each do |question|
      @survey.answers.build(question: question)
    end

      # No controller, filtra as perguntas da categoria "Engagement"
    @engagement_questions = @questions.select { |q| q.category == "Engagement" }

    # Agora, agrupa as perguntas pelo primeiro número antes do ponto
    @grouped_engagement_questions = @engagement_questions.group_by do |question|
      question.text.split(".").first.to_i
    end

    # Ordena as categorias por número e as perguntas dentro de cada categoria por número
    @grouped_censo_questions = @censo_questions.group_by do |question|
      question.text.split(".").first.to_i  # Agrupando pelo número antes do ponto
    end.sort.to_h

    # Agora, dentro de cada categoria, ordena as perguntas de forma numérica com base no número completo (antes e depois do ponto)
    @grouped_censo_questions.each do |category_number, questions|
      @grouped_censo_questions[category_number] = questions.sort_by do |question|
        question.text.split(".").map { |part| part.to_i }  # Divide em partes e converte cada parte para inteiro
      end
end

  end


  def create
    @survey = Survey.new(survey_params)
    @questions = Question.all

    if @survey.save
      redirect_to root_path, notice: "Pesquisa salva com sucesso!"
    else
      flash.now[:alert] = "Erro ao salvar a pesquisa. Verifique os campos."
      render :new
    end
  end

  def export_csv
    @surveys = Survey.all
    # Enviando o CSV gerado com codificação UTF-8
    send_data Survey.to_csv, filename: "surveys-#{Date.today}.csv", type: 'text/csv; charset=utf-8'
  end

  private

  def survey_params
    params.require(:survey).permit(
      :code,
      :recommendation_score,
      :general_feedback,
      answers_attributes: [:question_id, :response]
    )
  end
end
