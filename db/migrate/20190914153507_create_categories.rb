class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string    :name, null: false, unique: true
      t.integer   :parent_id
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
