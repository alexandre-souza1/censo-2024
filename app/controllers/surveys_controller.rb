class SurveysController < ApplicationController
  def new
    # Inicializa a pesquisa com o código fornecido (se aplicável)
    @survey = Survey.new(code: params[:code])

    # Carrega perguntas organizadas por categoria
    @engagement_questions = Question.where(category: 'Engagement')
    @censo_questions = Question.where(category: 'Censo')

    # Cria respostas associadas para todas as perguntas
    Question.all.each do |question|
      @survey.answers.build(question: question, response: "") # Resposta inicial em branco
    end

    # Agrupa e ordena perguntas por categoria
    @grouped_engagement_questions = group_and_sort_questions(@engagement_questions)
    @grouped_censo_questions = group_and_sort_questions(@censo_questions)
  end

  def create
    @survey = Survey.new(survey_params)

    # Recarrega perguntas organizadas por categoria para renderização em caso de erro
    @engagement_questions = Question.where(category: 'Engagement')
    @censo_questions = Question.where(category: 'Censo')
    @grouped_engagement_questions = group_and_sort_questions(@engagement_questions)
    @grouped_censo_questions = group_and_sort_questions(@censo_questions)

        # Certifique-se de formatar as respostas múltiplas como string separada por '-'
        format_multiple_responses(@survey.answers)

    if @survey.save
      redirect_to root_path, notice: "Pesquisa salva com sucesso!"
    else
      logger.debug(@survey.errors.full_messages)
      flash.now[:alert] = "Erro ao salvar a pesquisa. Verifique os campos."
      render :new
    end
  end

  def export_csv
    # Exporta os dados de pesquisas como CSV
    send_data Survey.to_csv, filename: "surveys-#{Date.today}.csv", type: 'text/csv; charset=utf-8'
  end

  private

  def survey_params
    params.require(:survey).to_unsafe_h
  end


  # Método para agrupar e ordenar perguntas por categoria
  def group_and_sort_questions(questions)
    grouped = questions.group_by do |question|
      # Extrai o número da categoria a partir do texto
      question.text.split(".").first.to_i
    end

    # Ordena as chaves do agrupamento (número da categoria)
    grouped.keys.sort.map do |key|
      # Ordena as perguntas dentro de cada grupo
      [
        key,
        grouped[key].sort_by do |question|
          question.text.split(".").map(&:to_i) # Ordena numericamente pelo prefixo
        end
      ]
    end.to_h # Retorna como hash ordenado
  end

  def format_multiple_responses(answers)
    answers.each do |answer|
      if answer.response.is_a?(Array)
        answer.response = answer.response.join('- ')
      end
    end
  end
end
