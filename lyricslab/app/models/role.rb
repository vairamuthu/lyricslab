class Role < ActiveRecord::Base
  has_many :roles_menus
  
  def self.admin_menus
    Role.find(:first, :conditions => {:name => "Admin"}).roles_menus
  end
  
  
end
