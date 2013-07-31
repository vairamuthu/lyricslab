class LanguagesController < ApplicationController
  
  def index
    @languages = Language.paginate(:page => params[:page], :per_page => 10, :order => "name asc")
    @count.nil? ? @count = 0 : @count = (params[:page].to_i - 1) * 10 
  end 
  
  def show
    @language = Language.find(params[:id])
  end
  
  def new
    @language = Language.new
    
  end
  
  def create
    @language = Language.new(language_params)
    status = @language.save
    if status
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @language = Language.find(params[:id])
  end
  
  def update
    @language = Language.find(params[:id]) 
    if @language.update_attributes(language_params)
      redirect_to :action => "index"
    else
      render :action => "edit"
      end
  end
  
  
   def destroy
    Language.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  def language_params
    params.require(:language).permit(:name,:short_name,:code)
  end
  
end
