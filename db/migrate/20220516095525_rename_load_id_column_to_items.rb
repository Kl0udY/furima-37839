class RenameLoadIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :load_id, :delivery_charge_id
  end
end
