class RenameCategoryToQuestionTypeInQuestions < ActiveRecord::Migration[7.1] # ou sua versão
  def change
    rename_column :questions, :category, :question_type
  end
end
