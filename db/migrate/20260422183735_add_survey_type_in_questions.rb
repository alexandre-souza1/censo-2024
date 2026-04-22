class AddSurveyTypeInQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :survey_type, :string
  end
end
