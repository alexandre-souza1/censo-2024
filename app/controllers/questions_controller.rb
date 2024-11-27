class QuestionsController < ApplicationController
  def export_csv
    questions = Question.all
    send_data questions.export_questions_to_csv, filename: "questions-#{Date.today}.csv"
  end
end
