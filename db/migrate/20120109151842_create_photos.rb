class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :attachable_id
      t.string :description  
      t.string :data_file_name  
      t.string :data_content_type  
      t.integer :data_file_size  
      t.datetime :data_updated_at
      t.string :parent  
      t.timestamps
    end
  end
end
