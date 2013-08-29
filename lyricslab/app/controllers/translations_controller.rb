class TranslationsController < ApplicationController
  
  def new
    @language = Language.find(params[:language_id])
    @translations = Language.find(:all) 
    @translation = Translation.new
    render :layout => false
  end
  
  def create
    @translation = Translation.new(translation_params)
    @language= @translation.language
    @status = @translation.save
    if @status
      respond_to do |format|
        format.js {render :template => "translations/create.js.erb"}
      end
            #  render :partial=>"translations/create.js.erb"
    end
   
  end

  def edit
    @language = Language.find(params[:language_id])
    @translations = Language.find(:all)
    @translation = Translation.find(params[:id])
    render :layout => false
  end
  
  def update     
    @translation = Translation.find(params[:id])
    @language = @translation.language
    @status = @translation.update_attributes(translation_params)   
    if @status
      respond_to do |format|
        format.js {render :template => "translations/update.js.erb"}
      end
    end
  end
  
    def destroy
     @trans_id = params[:id]
    @status = Translation.find(params[:id]).destroy
    if status
      respond_to do |format|
        format.js {render :template => "translations/delete.js.erb"}
      end
    end
  end
  
  
  def translation_params
    params.require(:translation).permit(:language_id,:translate_id,:status)
  end
end
