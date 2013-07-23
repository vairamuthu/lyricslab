class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :created_by
      t.integer :updated_by      
      t.timestamps
    end
  end
end
