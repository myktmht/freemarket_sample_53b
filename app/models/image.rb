class Image < ApplicationRecord
  belongs_to :item

  mount_uploaders :filenames, ImageUploader
end
