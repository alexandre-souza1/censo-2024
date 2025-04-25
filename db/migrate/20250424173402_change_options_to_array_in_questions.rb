class ChangeOptionsToArrayInQuestions < ActiveRecord::Migration[6.0]
  def change
    change_column :questions, :options, :string, array: true, default: []
  end
end
