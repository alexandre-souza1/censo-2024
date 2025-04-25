class AddStageToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :stage, :integer
  end
end
