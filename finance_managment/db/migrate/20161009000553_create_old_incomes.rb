class CreateOldIncomes < ActiveRecord::Migration
  def change
    create_table :old_incomes do |t|
      t.string :old_id
      t.string :year
      t.string :month
      t.string :income_src
      t.string :amount
      t.string :comments
      t.string :currency

      t.timestamps null: false
    end
  end
end
