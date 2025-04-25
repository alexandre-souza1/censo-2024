module QuestionsHelper
  def category_name_for(question)
    question.category&.name || "Sem categoria"
  end

  def category_name_by_id(category_id)
    Category.find_by(id: category_id)&.name || "Sem categoria"
  end
end
