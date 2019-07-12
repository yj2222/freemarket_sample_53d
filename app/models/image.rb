class Image < ApplicationRecord
  belongs_to :product, dependent: :destroy
  mount_uploader :url, ImageUploader
end
