class RolesController < ApplicationController
  
  def index
    @roles = Role.find(:all)
  end
  
  def show
    @role = Role.find(params[:id])
  end
  
  def new 
    @role = Role.new
  end
  
  def create
    
    @role = Role.new(role_params)
    status = @role.save
    if status
      redirect_to :action => "index"
    else
      render :action => "new"  
    end  
  end
  
  
  def edit
    @role = Role.find(params[:id])
    
  end
  
  
  def update
    @role = Role.find(params[:id])
    status = @role.update_attributes(role_params)
    if status
      redirect_to :action => "index"
    else
      render :action =>"edit"
    end
  end
  
  def destroy
    Role.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  def role_params
    params.require(:role).permit(:name)
  end
  
  
end
