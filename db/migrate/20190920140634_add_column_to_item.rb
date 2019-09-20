class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :size,     foreign_key: true
    add_reference :items, :category, null: false, foreign_key: true
    add_reference :items, :brand,    foreign_key: true
  end
end
