class AddImageRefToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :image, null: false, foreign_key: true, after: :category_id
  end
end
