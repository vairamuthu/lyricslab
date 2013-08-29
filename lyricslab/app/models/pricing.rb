class Pricing < ActiveRecord::Base
  belongs_to :translation_type
  validates :translation_type, :uniqueness => true  
end
