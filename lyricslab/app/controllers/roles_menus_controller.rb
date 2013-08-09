class RolesMenusController < ApplicationController
  def new
    @role = Role.find(params[:role_id])
    @menus = Menu.find(:all) 
    @roles_menu = RolesMenu.new
    render :layout => false
  end
  
  def create
    @roles_menu = RolesMenu.new(roles_menus_params)
    @role= @roles_menu.menu 
    @status = @roles_menu.save
        
    if @status
      
      respond_to do |format|
        format.js {render :template => "roles_menus/create.js.erb"}
      end
            #  render :partial=>"translations/create.js.erb"
    end
   
  end

  def edit
    @role = Role.find(params[:role_id])
    @menus = Menu.find(:all)
    @roles_menu = RolesMenu.find(params[:id])
    render :layout => false
  end
  
  def update     
    @roles_menu = RolesMenu.find(params[:id])
    @role = @roles_menu.role
    if @roles_menu.update_attributes(roles_menus_params)      
      respond_to do |format|
        format.js {render :template => "roles_menus/update.js.erb"}
      end
    end
  end
  
    def destroy
    @roles_menu_id = params[:id]
    @status = RolesMenu.find(params[:id]).destroy
    if status
      respond_to do |format|
        format.js {render :template => "roles_menus/destroy.js.erb"}
      end
    end
  end
  
  
  def roles_menus_params
    params.require(:roles_menu).permit(:role_id,:menu_id,:status)
  end
  
end
