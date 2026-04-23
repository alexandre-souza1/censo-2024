require 'axlsx'

class SurveysController < ApplicationController
  def new
    # Valida o código enviado e impede acesso se não existir
    if params[:code].present?
      @survey_code = SurveyCode.find_by(code: params[:code].upcase)

      if @survey_code.nil?
        redirect_to root_path, alert: "Código inválido!"
        return
      end

      # (Opcional) Impedir reutilização:
      # if @survey_code.used?
      #   redirect_to root_path, alert: "Este código já foi utilizado."
      #   return
      # end
    end

    # Continua sua lógica normal
    @survey = Survey.new(code: params[:code])

    @engagement_questions = Question.where(category: 'Engagement')
    @censo_questions = Question.where(category: 'services')

    # Cria respostas para TODAS as perguntas
    Question.all.each do |question|
      @survey.answers.build(question: question, response: "")
    end

    # Agrupa e ordena perguntas por categoria
    @grouped_engagement_questions = group_and_sort_questions(@engagement_questions)
    @grouped_censo_questions = group_and_sort_questions(@censo_questions)
  end

  def create
    @survey = Survey.new(survey_params)

    # Recarrega perguntas organizadas por categoria para renderização em caso de erro
    @engagement_questions = Question.where(category: 'Engagement')
    @censo_questions = Question.where(category: 'services')
    @grouped_engagement_questions = group_and_sort_questions(@engagement_questions)
    @grouped_censo_questions = group_and_sort_questions(@censo_questions)

    if @survey.save
      redirect_to survey_path(@survey), notice: "Pesquisa salva com sucesso!"
    else
      logger.debug(@survey.errors.full_messages)
      flash.now[:alert] = "Erro ao salvar a pesquisa. Verifique os campos."
      render :new
    end
  end

  def export_xlsx
    require 'caxlsx'

    p = Axlsx::Package.new
    wb = p.workbook
    sheet = wb.add_worksheet(name: "Pesquisas")

    # Cabeçalhos
    question_headers = Question.order(:id).map { |q| "Q#{q.id}: #{q.text}" }

    headers = ["Código", "Nome", "Unidade", "Data de Criação"] + question_headers
    sheet.add_row headers

    Survey.includes(:answers).find_each do |survey|
      survey_code = SurveyCode.find_by(code: survey.code)

      colaborador = survey_code&.colaborador || "Não encontrado"
      unidade = survey_code&.unidade || "Não encontrada"

      created_at = survey.created_at
                        .in_time_zone('America/Sao_Paulo')
                        .strftime('%Y-%m-%d %H:%M:%S')

      survey_data = [
        survey.code,
        colaborador,
        unidade,
        created_at
      ]

    answers_data = survey.answers.order(:question_id).map do |answer|
      format_response(answer.response)
    end

      sheet.add_row survey_data + answers_data
    end

    send_data p.to_stream.read,
      filename: "surveys-#{Date.today}.xlsx",
      type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  end


  def export_csv
    # Exporta os dados de pesquisas como CSV
    send_data Survey.to_csv, filename: "surveys-#{Date.today}.csv", type: 'text/csv; charset=utf-8'
  end

  def show
    @survey = Survey.find(params[:id])
  end


  private

  def survey_params
    params.require(:survey).permit(
      :code,
      answers_attributes: [
        :id,
        :question_id,
        :response,
        { response: [] },
        { response: {} }
      ]
    )
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

  def format_response(response)
    return "" if response.nil?

    # 👇 tenta converter string em hash
    if response.is_a?(String) && response.include?("=>")
      begin
        response = eval(response) # ⚠️ controlado (dados internos)
      rescue
        return response
      end
    end

    case response
    when String
      response

    when Integer
      response.to_s

    when Array
      response.join(", ")

    when Hash
      response
        .sort_by { |_, v| v.to_i }
        .map { |k, v| "#{v}º #{k}" }
        .join(" | ")

    else
      response.to_s
    end
  end
end
