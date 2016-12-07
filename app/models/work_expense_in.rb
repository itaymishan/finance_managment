# == Schema Information
#
# Table name: work_expense_ins
#
#  id         :integer          not null, primary key
#  old_id     :string
#  amount     :string
#  currency   :string
#  comments   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WorkExpenseIn < ActiveRecord::Base

end
