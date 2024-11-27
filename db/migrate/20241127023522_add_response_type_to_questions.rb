class AddResponseTypeToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :response_type, :string
    add_column :questions, :options, :text, array: true, default: []
  end
end
