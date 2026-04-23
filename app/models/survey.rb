require 'csv'

class Survey < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

  accepts_nested_attributes_for :answers

  validates :code, presence: true

  validate :validate_all_responses

  # =========================
  # VALIDAÇÃO DAS RESPOSTAS
  # =========================
  def validate_all_responses
    if answers.any? { |answer| response_blank?(answer.response) }
      errors.add(:answers, "Todas as respostas devem ser preenchidas")
    end
  end

  def response_blank?(response)
    return true if response.nil?

    if response.is_a?(String)
      response.strip.empty?
    elsif response.is_a?(Array)
      response.empty?
    elsif response.is_a?(Hash)
      response.values.reject(&:blank?).empty?
    else
      false
    end
  end

  # =========================
  # EXPORTAÇÃO CSV
  # =========================
  def self.to_csv
    attributes = ["code", "created_at"]

    CSV.generate(headers: true, encoding: 'UTF-8') do |csv|
      csv << attributes + Question.order(:id).map { |q| "Q#{q.id}: #{q.text}" }

      all.each do |survey|
        created_at_brasilia = survey.created_at
                                      .in_time_zone('Brasilia')
                                      .strftime('%Y-%m-%d %H:%M:%S')

        survey_data = [survey.code, created_at_brasilia]

        answers_data = survey.answers
                             .order(:question_id)
                             .map { |answer| format_response(answer.response) }

        csv << survey_data + answers_data
      end
    end
  end

  # =========================
  # FORMATAÇÃO DAS RESPOSTAS
  # =========================
  def self.format_response(response)
    case response
    when String
      response
    when Integer
      response.to_s
    when Array
      response.join(", ")
    when Hash
      response.sort_by { |_, v| v.to_i }
              .map { |k, v| "#{v}-#{k}" }
              .join(" | ")
    else
      response.to_s
    end
  end
end
