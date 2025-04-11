class CreateEvatributes < ActiveRecord::Migration[8.0]
  def change
    create_table :evatributes do |t|
      t.string :entity_type, null: false
      t.string :name, null: false
      t.string :column_name, null: false
      t.string :data_type, null: false

      t.timestamps
    end

    add_index :evatributes, :entity_type, name: 'index_evatributes_on_entity_type'
  end
end
