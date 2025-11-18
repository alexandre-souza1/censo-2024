class CreateSurveyCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_codes do |t|
      t.string :unidade
      t.string :colaborador
      t.string :cpf
      t.string :status
      t.string :code
      t.boolean :used

      t.timestamps
    end
    add_index :survey_codes, :code
  end
end
