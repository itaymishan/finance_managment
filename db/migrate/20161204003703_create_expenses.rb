class CreateExpenses < ActiveRecord::Migration

  def change
    create_table :expenses do |t|
      # t.string :year
      # t.string :month
      # t.references :category, index: true, forign_key: true
      # t.references :user, index: true, forign_key: true
      # t.decimal :amount, null: false


      t.timestamps null: false
    end
  end
end
