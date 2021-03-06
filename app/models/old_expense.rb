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
#  exported     :boolean          default(FALSE)
#

require 'csv'

class OldExpense < ActiveRecord::Base

  # validates :old_id, uniqueness: true
  # validates :insert_date, presence: true
  validates :month, presence: true
  validates :year, presence: true
  validates :category, presence: true
  validates :person, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  # validates :old_id, presence: true

  before_save :set_insert_date

  def set_insert_date
    self.insert_date = DateTime.now
  end

  def migrate_old_to_new
    category = Category.find_or_create_by(hebrew_name: self.category)
    user = User.find_or_create_by(first_name: self.person)
    expense_type = self.expense_type == 'אישי' ? 'personal' : 'home'
    currency = Currency.find_or_create_by(name: self.currency)
    luxury = self.is_luxury == 'כן' ? true : false

    expense = Expense.create!(year: self.year,
                    month: self.month,
                    user: user,
                    category: category,
                    expense_type: expense_type,
                    amount: self.amount.to_d,
                    currency: currency,
                    luxury: luxury,
                    comments: self.comments)
  end


  def self.import_from_csv
    csv_text = File.read('C:\\Users\\asus\\Desktop\\home_ex_db\\expenses.csv')
    csv = CSV.parse(csv_text, :headers => false)
    csv.each do |row|
      create_object(row)
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
                        is_luxury: hash_row[9],
                        comments: hash_row[10],
                        currency: hash_row[12]) if hash_row.count == 13
  end
end
