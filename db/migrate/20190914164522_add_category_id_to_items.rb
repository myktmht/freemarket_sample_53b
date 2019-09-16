class AddCategoryIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, null: false, foreign_key: true, after: :trade_status
  end
end
