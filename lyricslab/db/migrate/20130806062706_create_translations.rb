class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :language_id, :not_null => true
      t.integer :translate_id, :not_null => true
      t.boolean :status, :default => true
      t.integer :created_by
      t.integer :updated_by      
      t.timestamps
    end
  end
end
