# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  english_name :string
#  hebrew_name  :string
#  luxury       :boolean
#  active       :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Category < ActiveRecord::Base
  # - Relations - #
  has_many :expenses

  scope :active, -> { where(active: true) }
  # scope :active_sorted_freq, -> { 
  #   where(active: true)
  #     .joins(:expenses)
  #     .group('categories.hebrew_name', 'categories.id')
  #     .count.sort_by {|_key, value| -value}
  #     .map{|item| [item[1], item[0]]}.to_h.values
  # }

  scope :active_sorted_freq, -> { 
    active.pluck(:hebrew_name, :id)
  }
  
end
