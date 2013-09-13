class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         
         
  
  # attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_one :translator
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    
    data = access_token['info']
   # raise access_token['info']['email'].inspect
    logger.debug "Facebook User data: #{data.inspect}"
  
    if user = User.find_by_email(data["email"])  
         
    else
     user =  User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
    return user
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end  
  
 def user_menus
   if self.translator
     Role.find(:first, :conditions => {:name => "Translator"}).roles_menus.active
   else
     Role.find(:first, :conditions => {:name => "Customer"}).roles_menus
#     raise  Role.find(:first, :conditions => {:name => "Customer"}).roles_menus.inspect
   end
 end
  
     
end
