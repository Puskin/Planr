# == Schema Information
# Schema version: 20110725195649
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  color      :string(255)
#

class Category < ActiveRecord::Base      
  
  has_many :categorizations
  has_many :posts, :through => :categorizations
  
end
