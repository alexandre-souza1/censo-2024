require 'csv'

class Survey < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  accepts_nested_attributes_for :answers
  validates :code, :recommendation_score, :general_feedback, presence: true

  # Validação para verificar se todas as respostas estão presentes
  validate :validate_all_responses

  # Método que verifica se todas as respostas foram preenchidas
  def validate_all_responses
    logger.debug("Checking answers: #{answers.inspect}")
    if answers.any? { |answer| answer.response.blank? }
      errors.add(:answers, "Todas as respostas devem ser preenchidas")
    end
  end

  def self.to_csv
    attributes = ["code", "recommendation_score", "general_feedback"]

    CSV.generate(headers: true, encoding: 'UTF-8') do |csv|
      # Adicionando as perguntas com a codificação correta
      csv << attributes + Question.pluck(:id, :text).map { |id, text| "Q#{id}: #{text.force_encoding('UTF-8')}" }

      all.each do |survey|
        survey_data = attributes.map { |attr| survey.send(attr) }
        answers_data = survey.answers.order(:question_id).map(&:response)
        csv << survey_data + answers_data
      end
    end
  end
end
