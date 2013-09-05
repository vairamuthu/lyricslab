class TranslatorsController < ApplicationController

def new
  @translator = Translator.new
  @translator_translation = @translator.translator_translations.build  
  @user = current_user
  @translations = Translation.all
end


def create
 @translator = Translator.new(translator_params)
 @translator.translator_translations.build(translator_translation_params)
 status = @translator.save
 if status 
   flash[:notice] = "Successfully Registered and Pending for Admin Approval"
   redirect_to root_url
 else
   render :action => "new"
 end
end

def translator_params
   params.require(:translator).permit(:name,:address,:city, :state, :country, :user_id)
  
end

def translator_translation_params
   params.require(:translator_translation).permit(:translation_id)
end
end
