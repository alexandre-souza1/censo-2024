class Answer < ApplicationRecord
  belongs_to :survey
  belongs_to :question

  validates :response, presence: true
end
