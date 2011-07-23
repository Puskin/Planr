class User < ActiveRecord::Base                                              
                           
  has_attached_file :picture, :styles => { :thumb => "100x100>" }
  
  has_many :authentications  
  has_many :posts
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me          
  
  def apply_omniauth(omniauth)   
    case omniauth['provider']
      when 'facebook'
        self.apply_facebook(omniauth)
      end 
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token =>(omniauth['credentials']['token'] rescue nil))
  end       
  
  def facebook
    @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end     
     
  
  protected

  def apply_facebook(omniauth)
    if (extra = omniauth['extra']['user_hash'] rescue false)
      self.email = (extra['email'] rescue '')
    end
  end
                                                                               
end
