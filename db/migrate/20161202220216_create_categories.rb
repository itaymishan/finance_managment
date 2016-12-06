class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :english_name
      t.string  :hebrew_name
      t.boolean :luxury

      t.timestamps null: false
    end
  end
end
