class CreateLenses < ActiveRecord::Migration[6.1]
  def change
    create_table :lenses do |t|
     
      t.string :color 
      t.text :description
      t.integer :prescription_type, default: 0
      t.integer :lens_type, default: 0
      t.integer :stock
      t.decimal :price

      t.timestamps
    end
  end
end
