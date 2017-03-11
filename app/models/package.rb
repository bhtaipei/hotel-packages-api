class Package < ActiveRecord::Base

  belongs_to :merchant

  scope :published, ->{ where(published: true) }

  has_attached_file :image,
    :styles => { :thumbnail => "150x150^" },
    :path => ":class/image/:hash:id_:style.:extension"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 2.megabytes #magic number!

  validates :name, presence: true, length: {maximum: 255}
  validates :original_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discounted_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :merchant_id, presence: true

  def image_url
    self.image.file? ? self.image.url : nil
  end

  def image_thumbnail_url
    self.image.file? ? self.image.url(:thumbnail) : nil
  end

end
