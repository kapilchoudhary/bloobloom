class CreateGlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :glasses do |t|
      t.decimal :price
      t.references :frame, null: false, foreign_key: true
      t.references :lense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
