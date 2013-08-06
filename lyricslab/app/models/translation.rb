class Translation < ActiveRecord::Base
belongs_to :language
belongs_to :translate, :foreign_key => "translate_id", :class_name => "Language"

end
