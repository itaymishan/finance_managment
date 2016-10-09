# == Schema Information
#
# Table name: old_expenses
#
#  id           :integer          not null, primary key
#  old_id       :string
#  insert_date  :string
#  month        :string
#  year         :string
#  category     :string
#  person       :string
#  expense_type :string
#  amount       :string
#  is_luxury    :string
#  comments     :string
#  currency     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'csv'

class OldExpense < ActiveRecord::Base

  validates :old_id, uniqueness: true
  validates :insert_date, presence: true
  validates :month, presence: true
  validates :year, presence: true
  validates :category, presence: true
  validates :person, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  validates :old_id, presence: true

  def self.import_from_csv
    csv_text = File.read('C:\\Users\\asus\\Desktop\\home_ex_db\\tmp.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      create_object(row.to_hash.keys)
      create_object(row.to_hash.values)
    end
  end

  def self.create_object(hash_row)
    OldExpense.find_or_create_by!(old_id: hash_row[0],
                        insert_date: hash_row[1],
                        month: hash_row[2],
                        year: hash_row[3],
                        category: hash_row[4],
                        person: hash_row[5],
                        expense_type: hash_row[6],
                        amount: hash_row[7],
                        is_luxury: hash_row[8],
                        comments: hash_row[9],
                        currency: hash_row[10]) if hash_row.count == 11
debugger
  end
end
