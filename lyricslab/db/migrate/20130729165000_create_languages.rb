class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name, :not_null =>false
      t.string :short_name, :not_null => false
      t.string :code, :not_null => false
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
