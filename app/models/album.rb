class Album < ActiveRecord::Base
  #attr_accessible :photo
  has_many :photos, :dependent => :destroy, :foreign_key => :attachable_id
end
