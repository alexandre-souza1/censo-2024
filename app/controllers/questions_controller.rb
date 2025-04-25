class QuestionsController < ApplicationController

  def index
    @questions = Question.order(:id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def export_csv
    questions = Question.all
    send_data questions.export_questions_to_csv, filename: "questions-#{Date.today}.csv"
  end

  def new_import
    # Apenas renderiza a view com o formulário
  end

  def import
    if params[:file].present?
      if params[:file].content_type != "text/csv"
        redirect_to new_import_questions_path, alert: "Formato de arquivo inválido. Envie um arquivo .CSV."
        return
      end

      begin
        result = Question.import_from_csv(params[:file])
        redirect_to questions_path, notice: "#{result[:imported]} perguntas importadas com sucesso. #{result[:skipped]} ignoradas."
      rescue => e
        redirect_to new_import_questions_path, alert: "Erro ao importar CSV: #{e.message}"
      end
    else
      redirect_to new_import_questions_path, alert: "Por favor, selecione um arquivo CSV."
    end
  end

  def edit
    @question = Question.find(params[:id])
    @categories = Category.all
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, notice: "Pergunta atualizada com sucesso."
    else
      render :edit, alert: "Erro ao atualizar a pergunta."
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "Pergunta excluída com sucesso."
  end

  def destroy_all
    Question.delete_all
    redirect_to questions_path, notice: "Todas as perguntas foram excluídas com sucesso."
  end

  private

  def question_params
    if params[:question][:options].is_a?(String)
      options = params[:question][:options].split(',').map(&:strip).reject(&:blank?)
      params[:question][:options] = options
    end

    params.require(:question).permit(:text, :question_type, :response_type, :category_id, :stage, options: [])
  end

end
