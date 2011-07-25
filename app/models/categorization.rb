# == Schema Information
# Schema version: 20110725195649
#
# Table name: categorizations
#
#  id          :integer         not null, primary key
#  post_id     :integer
#  category_id :integer
#  position    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Categorization < ActiveRecord::Base                    
  
  belongs_to :post
  belongs_to :category
  
end
