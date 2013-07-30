class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
        t.string :name, :not_null => true
        t.string :url, :not_null => true
        t.string :description
        t.timestamps
    end
  end
end
