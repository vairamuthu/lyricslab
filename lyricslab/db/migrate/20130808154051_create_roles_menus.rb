class CreateRolesMenus < ActiveRecord::Migration
  def change
    create_table :roles_menus do |t|
      t.integer :menu_id, :not_null => true
      t.integer :role_id, :not_null => true
      t.string :status, :default => true
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
