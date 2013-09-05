class CreateTranslatorTranslations < ActiveRecord::Migration
  def change
    create_table :translator_translations do |t|
      t.integer :translator_id , :null => false
      t.integer :translation_id , :null => false
      t.boolean :is_approved, :default => false 
      t.timestamps
    end
  end
end
