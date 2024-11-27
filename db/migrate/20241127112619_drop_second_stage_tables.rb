class DropSecondStageTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :second_stage_answers, if_exists: true
    drop_table :second_stage_questions, if_exists: true
  end
end
