class Question < ApplicationRecord
  has_many :answers
  has_many :surveys, through: :answers
end
