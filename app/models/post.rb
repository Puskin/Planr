# == Schema Information
# Schema version: 20110725195649
#
# Table name: posts
#
#  id                   :integer         not null, primary key
#  title                :string(255)
#  content              :text
#  created_at           :datetime
#  updated_at           :datetime
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  user_id              :integer
#

class Post < ActiveRecord::Base   
  
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user                                                         
  
  has_many :categorizations      
  has_many :comments
  has_many :categories, :through => :categorizations
 
end
