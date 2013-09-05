class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :name, :null => false
      t.string :address
      t.integer :user_id, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :country, :null => false
      t.boolean :is_approved, :default => false
      t.timestamps
    end
  end
end
