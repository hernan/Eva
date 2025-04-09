class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.boolean :active, default: false
      t.integer :in_stock, default: 0

      t.timestamps
    end

    add_index :products, :sku, unique: true
  end
end
