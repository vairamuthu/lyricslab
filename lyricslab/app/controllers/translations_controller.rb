class TranslationsController < ApplicationController
  
  def new
    @language = Language.find(params[:language_id])
    @translations = Language.find(:all) 
    @translation = Translation.new
    render :layout => false
  end
  
  def create
    @translation = Translation.new(translation_params)
    if @translation.save
      respond_to do |format|
        format.js  {render :layout => false }
      end
    end
  end

  def edit
  end
  
  def translation_params
    params.require(:translation).permit(:language_id,:translate_id,:status)
  end
end
