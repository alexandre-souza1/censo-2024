require 'axlsx'

class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

def validate_code
  code = params[:code].to_s.upcase
  if Codigo.exists?(code: code)
    redirect_to new_survey_path(code: code)
  else
    flash[:error] = "Código inválido! Por favor, insira um código válido."
    redirect_to root_path # Ou para onde seu formulário de código está
  end
end

  def new
    @survey = Survey.new(code: params[:code])

    # Carrega as perguntas separadas por tipo
    @engagement_questions = Question.where(question_type: 'engagement')
    @censo_questions = Question.where(question_type: 'censo')

    # Cria respostas associadas para todas as perguntas
    Question.all.each do |question|
      @survey.answers.build(question: question, response: "")
    end

    # Agrupa e ordena perguntas por categoria
    @grouped_engagement_questions = group_and_sort_questions(@engagement_questions)
    @grouped_censo_questions = group_and_sort_questions(@censo_questions)

    # Agrupamento por etapa, útil para uso nas partials
    @etapa_1_questions = @engagement_questions.select { |q| q.stage == 1 }
    @etapa_2_questions = @engagement_questions.select { |q| q.stage == 2 }
  end

  def create
    @survey = Survey.new(survey_params)
    @questions = Question.all.order(:category_id, :stage)
    @survey.answers.each do |answer|
      answer.response = nil if answer.response.blank? # Remove respostas vazias, se necessário
    end

    if @survey.save
      redirect_to finish_path, notice: "Pesquisa salva com sucesso!"
    else
      flash.now[:alert] = "Erro ao salvar a pesquisa. Verifique os campos."
      render :new
    end
  end

  def export_xlsx
    require 'caxlsx' # Certifique-se de carregar a biblioteca

    # Cria um novo arquivo Excel
    p = Axlsx::Package.new
    wb = p.workbook
    sheet = wb.add_worksheet(name: "Pesquisas")

    # Cabeçalhos: Código, Data, e todas as perguntas
    question_headers = Question.order(:id).pluck(:id, :text).map { |id, text| "Q#{id}: #{text}" }
    headers = ["Código", "Data de Criação"] + question_headers
    sheet.add_row headers

    # Dados das pesquisas
    Survey.all.each do |survey|
      created_at_brasilia = survey.created_at.in_time_zone('America/Sao_Paulo').strftime('%Y-%m-%d %H:%M:%S')
      survey_data = [survey.code, created_at_brasilia]

      # Respostas ordenadas por question_id
      answers_data = survey.answers.order(:question_id).map do |answer|
        resposta = answer.response.to_s

        if resposta.start_with?('["') && resposta.end_with?('"]')
          # Remove colchetes e aspas e separa itens com vírgula
          resposta[2..-3].split('", "').join(', ')
        else
          resposta
        end
      end

      sheet.add_row survey_data + answers_data
    end

    # Exporta o arquivo
    send_data p.to_stream.read, filename: "surveys-#{Date.today}.xlsx", type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  end

  def destroy_all
    if request.delete?
      Survey.destroy_all
      redirect_to surveys_path, notice: "Todas as pesquisas foram deletadas com sucesso!"
    else
      redirect_to surveys_path, alert: "Ação não permitida."
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path, notice: "Pesquisa deletada com sucesso!"
  end

  def show
    @survey = Survey.find(params[:id])

    # Agrupar respostas por categoria e etapa
    @grouped_answers = @survey.answers.includes(:question).group_by { |a| [a.question.category_id, a.question.stage] }
  end

  private

  def survey_params
    permitted = params.require(:survey).permit(:code, answers_attributes: [:response, :question_id, response: []])

    # Garantir que `response` seja sempre um array (mesmo se vier como string)
    permitted[:answers_attributes]&.each do |_, answer_attrs|
      answer_attrs[:response] = Array(answer_attrs[:response]) if answer_attrs[:response].present?
    end

    permitted
  end

  def group_and_sort_questions(questions)
    grouped = questions.group_by(&:category_id)

    grouped.transform_values do |questions_in_category|
      questions_in_category.sort_by(&:stage)
    end
  end

  def format_multiple_responses(answers)
    answers.each do |answer|
      if answer.response.is_a?(Array)
        answer.response = answer.response.join('- ')
      end
    end
  end
end
