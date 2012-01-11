class Photo < ActiveRecord::Base
  #attr_accessible :photo
  belongs_to :album, :foreign_key => :attachable_id
 
  has_attached_file :data, 
        :url => "/assets/images/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension",
        :styles => { 
          :large => "800x800>", 
          :medium => "300x300>", 
          :thumb => "100x100#"}
   
  validates_attachment_presence :data
  #validates_attachment_size :data, :less_than => 2.megabytes  
  validates_attachment_content_type :data, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
