class PricingsController < ApplicationController
   def index
    @pricings = Pricing.paginate(:page => params[:page], :per_page => 10, :order => "id asc")
    @count.nil? ? @count = 0 : @count = (params[:page].to_i - 1) * 10 
    #render :layout => false
  end 
  
  def show_all
    @pricings = Pricing.all    
  end
  
  def new
    @pricing = Pricing.new    
  end
  
  def create
    @pricing = Pricing.new(pricing_params)
   
    status = @pricing.save
    if status
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @pricing = Pricing.find(params[:id])
    
  end
  
  def update
    @pricing = Pricing.find(params[:id]) 
    if @pricing.update_attributes(pricing_params)
      redirect_to :action => "index"
    else
      render :action => "edit"
      end
  end
  
  
   def destroy
    Pricing.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
 
  
  def pricing_params    
    params.require(:pricing).permit(:translation_type_id,:words,:amount)
  end


end
