class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.decimal :price
      t.text :description
      t.timestamps
    end
  end
end
