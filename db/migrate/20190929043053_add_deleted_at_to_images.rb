class AddDeletedAtToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :deleted_at, :datetime, after: :updated_at
  end
end
