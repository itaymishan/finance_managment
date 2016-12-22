# == Schema Information
#
# Table name: expenses
#
#  id           :integer          not null, primary key
#  year         :integer
#  month        :integer
#  category_id  :integer
#  expense_type :integer
#  user_id      :integer
#  amount       :decimal(, )      not null
#  currency_id  :integer          not null
#  comments     :text
#  luxury       :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Expense < ActiveRecord::Base

  # - Relations - #
  belongs_to :category
  belongs_to :user
  belongs_to :currency

  enum expense_types: {
    home: 'home',
    personal: 'personal'
  }

  scope :between_dates, -> (start_year, start_month, end_year, end_month) {
    where(year: start_year..end_year).where(month: start_month..end_month)
  }

  scope :group_by_currency, -> {
    joins(:currency).group('currencies.name').sum(:amount)
  }

end
