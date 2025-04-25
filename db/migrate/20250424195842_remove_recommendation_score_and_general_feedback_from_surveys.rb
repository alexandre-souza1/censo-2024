class RemoveRecommendationScoreAndGeneralFeedbackFromSurveys < ActiveRecord::Migration[7.1]
  def change
    remove_column :surveys, :recommendation_score, :integer
    remove_column :surveys, :general_feedback, :text
  end
end
