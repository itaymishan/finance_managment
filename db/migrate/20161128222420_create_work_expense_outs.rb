class CreateWorkExpenseOuts < ActiveRecord::Migration
  def change
    create_table :work_expense_outs do |t|
      t.string :old_id
      t.string :amount
      t.string :currency
      t.string :comments
      
      t.timestamps null: false
    end
  end
end
