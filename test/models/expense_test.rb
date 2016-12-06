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

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
