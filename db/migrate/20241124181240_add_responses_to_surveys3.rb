class AddResponsesToSurveys3 < ActiveRecord::Migration[7.1]
  def change
   # Adicionar as novas colunas (response4 até response46)
    (4..46).each do |i|
      remove_column :surveys, "response#{i}", :string
    end

   # Adicionar as novas colunas (response4 até response46)
    (4..46).each do |i|
      add_column :surveys, "response#{i}", :string
    end
  end
end
