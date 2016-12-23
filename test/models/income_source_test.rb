# == Schema Information
#
# Table name: income_sources
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  active      :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hebrew_name :string
#

require 'test_helper'

class IncomeSourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
