class CreateExpenses < ActiveRecord::Migration

  def change
    create_table :expenses do |t|
      t.integer     :year
      t.integer     :month
      t.references  :category, index: true, forign_key: true, index: true
      t.integer     :expense_type
      t.references  :user, index: true, forign_key: true, index: true
      t.decimal     :amount, null: false
      t.references  :currency, null: false, forign_key: true, index: true
      t.text        :comments
      t.boolean     :luxury, default: false

      t.timestamps null: false
    end
  end
end
