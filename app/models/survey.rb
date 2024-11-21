class Survey < ApplicationRecord
  validates :response1, :response2, presence: true
  # Adicione mais validações para outras respostas se necessário
end
