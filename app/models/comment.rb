# == Schema Information
# Schema version: 20110725195649
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  post_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base       
  belongs_to :post
  belongs_to :user
end
