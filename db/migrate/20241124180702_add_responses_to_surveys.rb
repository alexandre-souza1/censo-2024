class AddResponsesToSurveys < ActiveRecord::Migration[7.1]
  def change
    # Remover as colunas antigas
    remove_column :surveys, :response1
    remove_column :surveys, :response2
    remove_column :surveys, :response3

    # Adicionar as novas colunas (response4 até response46)
    (4..46).each do |i|
      add_column :surveys, "response#{i}", :string
    end
  end
end
