class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :translation_type_id
      t.integer :words
      t.float   :amount
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
