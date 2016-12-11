class AddActiveToCategory < ActiveRecord::Migration
  def change
    add_column :category, :active, :boolean, default: true, null: false
  end
end
