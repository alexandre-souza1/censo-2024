class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :code
      t.string :response1
      t.string :response2
      t.string :response3

      t.timestamps
    end
  end
end
