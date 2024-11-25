class RemoveResponsesFromSurveys < ActiveRecord::Migration[7.0]
  def change
    (1..46).each do |i|
      remove_column :surveys, "response#{i}", :string
    end
  end
end
