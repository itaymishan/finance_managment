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

require 'test_helper'

class OldExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
