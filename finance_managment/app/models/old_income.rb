# == Schema Information
#
# Table name: old_incomes
#
#  id         :integer          not null, primary key
#  old_id     :string
#  year       :string
#  month      :string
#  income_src :string
#  amount     :string
#  comments   :string
#  currency   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'csv'
class OldIncome < ActiveRecord::Base
  validates :old_id, uniqueness: true
  validates :year, presence: true
  validates :month, presence: true
  validates :income_src, presence: true
  validates :amount, presence: true
  validates :currency, presence: true

  def self.import_from_csv
    csv_text = File.read('C:\\Users\\asus\\Desktop\\home_ex_db\\income.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      create_object(row.to_hash.keys)
      create_object(row.to_hash.values)
    end
  end

  def self.create_object(hash_row)
    OldIncome.find_or_create_by!(old_id: hash_row[0],
                        year: hash_row[1],
                        month: hash_row[2],
                        amount: hash_row[4],
                        income_src: hash_row[3],
                        comments: hash_row[5],
                        currency: hash_row[6]) if hash_row.count == 7
  end
end
