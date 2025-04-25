require 'csv'

class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :surveys, through: :answers

  validates :options, absence: true, if: :textbox?
  validates :options, presence: true, unless: :textbox?

  def textbox?
    response_type == 'textbox'
  end

  def self.export_questions_to_csv
    CSV.generate(headers: true, col_sep: ",", encoding: "UTF-8") do |csv|
      csv << ["ID", "pergunta", "categoria", "etapa", "response_type", "opcoes"]

      all.each do |question|
        csv << [
          question.id,
          question.text,
          question.question_type,
          question.category_id,
          question.stage,
          question.response_type,
          question.options.join("|")
        ]
      end
    end.encode("ISO-8859-1")
  end

  def self.import_from_csv(file)
    imported = 0
    skipped = 0

    csv_text = file.read.force_encoding("UTF-8").gsub(/\xEF\xBB\xBF/, '')
    csv = CSV.parse(csv_text, headers: true, col_sep: ";")

    csv.each do |row|
      question_data = {
        text:           row["pergunta"],
        question_type:  row["tipo"],
        category_id:    row["categoria_id"],
        stage:          row["etapa"],
        response_type:  row["response_type"],
        options:        row["opcoes"].to_s.split(",").map(&:strip)
      }

      question = new(question_data)

      if question.save
        imported += 1
      else
        skipped += 1
      end
    end

    { imported: imported, skipped: skipped }
  end
end
