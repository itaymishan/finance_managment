class CreateOldExpenses < ActiveRecord::Migration
  def change
    create_table :old_expenses do |t|
      t.string :old_id
      t.string :insert_date
      t.string :month
      t.string :year
      t.string :category
      t.string :person
      t.string :expense_type
      t.string :amount
      t.string :is_luxury
      t.string :comments
      t.string :currency

      t.timestamps null: false
    end
  end
end
