class AddDeletedAtToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :deleted_at, :datetime, after: :updated_at
  end
end
