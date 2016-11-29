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

require 'test_helper'

class OldIncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
