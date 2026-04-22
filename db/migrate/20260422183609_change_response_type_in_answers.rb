class ChangeResponseTypeInAnswers < ActiveRecord::Migration[7.1]
  def change
    change_column :answers, :response, :jsonb, using: 'response::jsonb'
  end
end
