class Image < ApplicationRecord
  belongs_to :item, optional: true

  mount_uploaders :filenames, ImageUploader
end
