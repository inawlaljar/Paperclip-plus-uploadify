class Product < ActiveRecord::Base
  
  attr_accessible :category_id, :photo 
  belongs_to :category
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  
  #validates_attachment_presence :photo
  #validates_attachment_size :photo, :less_than => 5.megabytes
  #validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  before_post_process :is_image?
  def is_image?
    !(self.photo.content_type =~ /^image/).nil?
  end
end
