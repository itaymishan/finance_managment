# == Schema Information
#
# Table name: incomes
#
#  id         :integer          not null, primary key
#  source     :integer
#  amount     :decimal(, )
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Income < ActiveRecord::Base
end
