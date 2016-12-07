# == Schema Information
#
# Table name: currencies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Currency < ActiveRecord::Base
  # - Relations - #
  has_many :expenses
end
