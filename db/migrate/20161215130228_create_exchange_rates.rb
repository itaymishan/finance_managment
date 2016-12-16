class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.string :from, null: false
      t.string :to, null: false
      t.decimal :rate, null: false

      t.timestamps null: false
    end
  end
end
