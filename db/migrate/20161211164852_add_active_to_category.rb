class AddActiveToCategory < ActiveRecord::Migration
  def change
    unless column_exists? :categories, :active
      add_column :categories, :active, :boolean, default: true, null: false
    end
  end
end
