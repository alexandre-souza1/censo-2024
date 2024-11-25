class AddFeedbackAndRecommendationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :recommendation_score, :integer
    add_column :users, :general_feedback, :text
  end
end
