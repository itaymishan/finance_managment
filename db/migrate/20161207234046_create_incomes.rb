class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.references :income_source, index: true, forign_key: true
      t.decimal :amount, null: false
      t.text :comments

      t.timestamps null: false
    end
  end
end
