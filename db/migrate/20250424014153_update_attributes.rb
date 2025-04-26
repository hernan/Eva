class UpdateAttributes < ActiveRecord::Migration[8.0]
  def change
    add_column :evatributes, :default, :string, default: ''
    add_column :evatributes, :options, :string, default: ''
    add_column :evatributes, :required, :boolean, default: false
    add_column :evatributes, :multiple, :boolean, default: false
  end
end
