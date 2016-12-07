class CreateIncomeSources < ActiveRecord::Migration
  def change
    create_table :income_source do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
