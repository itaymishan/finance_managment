# == Schema Information
#
# Table name: work_expense_outs
#
#  id         :integer          not null, primary key
#  old_id     :string
#  amount     :string
#  currency   :string
#  comments   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WorkExpenseOutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
