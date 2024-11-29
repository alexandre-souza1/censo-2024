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
    attributes = ["code", "recommendation_score", "general_feedback", "created_at"]

    CSV.generate(headers: true, encoding: 'UTF-8') do |csv|
      # Adicionando as perguntas com a codificação correta
      csv << attributes + Question.pluck(:id, :text).map { |id, text| "Q#{id}: #{text.force_encoding('UTF-8')}" }

      all.each do |survey|
        # Converte 'created_at' para o horário de Brasília (GMT-3) e formata a data
        created_at_brasilia = survey.created_at.in_time_zone('Brasilia').strftime('%Y-%m-%d %H:%M:%S')

        # Prepara os dados da pesquisa, incluindo o created_at convertido
        survey_data = attributes.map { |attr| attr == 'created_at' ? created_at_brasilia : survey.send(attr) }

        # Prepara as respostas das perguntas
        answers_data = survey.answers.order(:question_id).map { |answer| answer.response.force_encoding('UTF-8') }

        # Adiciona a linha no CSV
        csv << survey_data + answers_data
      end
    end
  end
end
