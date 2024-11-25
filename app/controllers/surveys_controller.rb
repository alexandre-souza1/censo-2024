class SurveysController < ApplicationController
  def new
    @survey = Survey.new(code: params[:code]) # Inicializa a pesquisa com o código fornecido
    @questions = Question.all # Carrega todas as perguntas

    # Cria as respostas relacionadas às perguntas
    @questions.each do |question|
      @survey.answers.build(question: question)
    end

    @grouped_questions = @questions.group_by { |question| question.text.split(".").first.to_i }

    # Define os nomes das categorias
    @category_names = {
      1 => "LIDERANÇAS",
      2 => "SEGURANÇA",
      3 => "SERVIÇOS GERAIS",
      4 => "RECONHECIMENTO",
      5 => "TREINAMENTO E DESENVOLVIMENTO",
      6 => "PLANEJAMENTO (FÉRIAS E JORNADA)",
      7 => "REMUNERAÇÃO E BENEFÍCIOS",
      8 => "PERTENCIMENTO",
      9 => "COMUNICAÇÃO",
      10 => "SEGURANÇA PSICOLÓGICA",
    }
  end


  def create
    @survey = Survey.new(survey_params)
    @questions = Question.all
    @category_names = {
      1 => "LIDERANÇAS",
      2 => "SEGURANÇA",
      3 => "SERVIÇOS GERAIS",
      4 => "RECONHECIMENTO",
      5 => "TREINAMENTO E DESENVOLVIMENTO",
      6 => "PLANEJAMENTO (FÉRIAS E JORNADA)",
      7 => "REMUNERAÇÃO E BENEFÍCIOS",
      8 => "PERTENCIMENTO",
      9 => "COMUNICAÇÃO",
      10 => "SEGURANÇA PSICOLÓGICA",
    }

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
