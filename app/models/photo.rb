class Photo < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
end
 #has_attached_file :image, styles: { :medium => "640x" }
 #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
