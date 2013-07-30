class MenusController < ApplicationController
  
  def index
    @menus = Menu.find(:all)
  end
  
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = Menu.new(menu_params)
    status = @menu.save
    if status
      redirect_to :action =>"index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @menu = Menu.find(params[:id])
  end
  
  def update
    @menu = Menu.find(params[:id])
    status = @menu.update_attributes(menu_params)
    if status
      redirect_to :action => "index"
    else
      render :action=>"edit"
    end
      end
      
      
    def destroy
    Menu.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  def menu_params
    params.require(:menu).permit(:name,:url,:description)
  end
end
