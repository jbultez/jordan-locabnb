class Photo < ApplicationRecord
  belongs_to :room
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/png","image/jpg"] }
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 7.megabytes
end
