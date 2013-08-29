class CreateTranslationTypes < ActiveRecord::Migration
  def change
    create_table :translation_types do |t|
      t.string :name, :not_null => true
      t.boolean :status
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
