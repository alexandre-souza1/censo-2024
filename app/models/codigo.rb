class Codigo < ApplicationRecord
  # Validações se necessário
  validates :code, presence: true, uniqueness: true
end
