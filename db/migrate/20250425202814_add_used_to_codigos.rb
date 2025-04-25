class AddUsedToCodigos < ActiveRecord::Migration[7.1]
  def change
    add_column :codigos, :used, :boolean, default: false
  end
end
