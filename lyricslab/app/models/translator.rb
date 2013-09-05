class Translator < ActiveRecord::Base
  has_many :translator_translations
  belongs_to :user
end
