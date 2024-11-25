class AddResponsesToSurveys2 < ActiveRecord::Migration[7.1]
  def change
    (1..3).each do |i|
      add_column :surveys, "response#{i}", :string
    end
  end
end
