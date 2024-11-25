class AddNpsAndFeedbackToSurveys < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :recommendation_score, :integer
    add_column :surveys, :general_feedback, :text
  end
end
