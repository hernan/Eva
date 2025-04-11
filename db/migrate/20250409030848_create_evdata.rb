class CreateEvdata < ActiveRecord::Migration[8.0]
  def change
    create_table :evdata do |t|
      t.bigint :entity_id, null: false
      t.string :entity_type, null: false
      t.json :data, null: false, default: '{}'
    end

    add_index :evdata, [ :entity_id, :entity_type ], name: 'index_evdata_on_entity_id_and_entity_type'
  end
end
