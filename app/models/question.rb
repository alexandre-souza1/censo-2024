class Question < ApplicationRecord
  has_many :answers
  has_many :surveys, through: :answers

  def self.export_questions_to_csv
    CSV.generate(headers: true) do |csv|
      csv << ["ID", "Texto da Pergunta", "Categoria"]

      all.each do |question|
        csv << [question.id, question.text, question.category]
      end
    end
  end
end
