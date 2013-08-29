class TranslationTypesController < ApplicationController
  def index
    @translation_types = TranslationType.paginate(:page => params[:page], :per_page => 10, :order => "name asc")
    @count.nil? ? @count = 0 : @count = (params[:page].to_i - 1) * 10 
    #render :layout => false
  end 
  
  def show
    @translation_type = TranslationType.find(params[:id])
  end
  
  def new
    @translation_type = TranslationType.new    
  end
  
  def create
    @translation_type = TranslationType.new(translation_type_params)
    status = @translation_type.save
    if status
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @translation_type = TranslationType.find(params[:id])
    
  end
  
  def update
    @translation_type = TranslationType.find(params[:id]) 
    if @translation_type.update_attributes(translation_type_params)
      redirect_to :action => "index"
    else
      render :action => "edit"
      end
  end
  
  
   def destroy
    TranslationType.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  def add_translation
    render :layout => false
  end
  
  def translation_type_params
    params.require(:translation_type).permit(:name,:short_name,:code)
  end

end
