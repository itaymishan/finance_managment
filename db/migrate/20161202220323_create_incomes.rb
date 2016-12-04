class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :source
      t.text :comments

      t.timestamps null: false
    end
  end
end
