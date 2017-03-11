class Merchant < ActiveRecord::Base

  has_many :packages
  accepts_nested_attributes_for :packages, :allow_destroy => true

  scope :published, ->{ where(published: true) }

  has_attached_file :image,
    :styles => { :thumbnail => "150x150^" },
    :path => ":class/image/:hash:id_:style.:extension"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 2.megabytes #magic number!

  validates :name, presence: true, length: {maximum: 255}

  def image_url
    self.image.file? ? self.image.url : nil
  end

  def image_thumbnail_url
    self.image.file? ? self.image.url(:thumbnail) : nil
  end

end
