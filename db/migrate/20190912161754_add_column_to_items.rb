class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :shipping_from, :integer, after: :shipping_fee
  end
end
