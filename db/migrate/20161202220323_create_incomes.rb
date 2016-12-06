class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.integer :source
      t.decimal :amount
      t.text :comments

      t.timestamps null: false
    end
  end
end
