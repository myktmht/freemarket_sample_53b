class AddDeletedAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deleted_at, :datetime, after: :updated_at
  end
end
