class RenameFileimageColumnToImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :filename, :image
  end
end
