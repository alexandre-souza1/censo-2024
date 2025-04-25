class Answer < ApplicationRecord
  belongs_to :survey
  belongs_to :question

  def response
    super.to_s  # Apenas converte para string, sem interferir em arrays
  end
end
