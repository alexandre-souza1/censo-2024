class ChangeResponseToArrayInAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :response, 'text[]', using: 'ARRAY[response]::text[]', default: []
  end
end
