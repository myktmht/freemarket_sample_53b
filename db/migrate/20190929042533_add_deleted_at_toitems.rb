class AddDeletedAtToitems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :deleted_at, :datetime, after: :updated_at
  end
end
