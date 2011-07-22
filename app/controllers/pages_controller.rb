class PagesController < ApplicationController           
  
  def home              
    
    if signed_in?
    
    facebook_authentication = current_user.authentications.find_by_provider(['facebook'])
    auth_token = facebook_authentication.token
  
    me = FbGraph::User.me(auth_token)   
    @user = me.fetch
    @picture = @user.picture
    
    end
    
  end

  def contact
  end

end
