class Post < ActiveRecord::Base   
  
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user                                                         
  
  has_many :categorizations      
  has_many :comments
  has_many :categories, :through => :categorizations
 
end
