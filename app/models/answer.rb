class Answer < ApplicationRecord
  belongs_to :survey
  belongs_to :question

  validates :response, presence: true

  def response
    if super.is_a?(Array) && super.present?
      super.join(' - ')  # Junta os elementos do array com o delimitador '- '
    else
      super.to_s  # Converte para string se não for um array ou se estiver vazio
    end
  end
end
