class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer     :zipcode
      t.integer     :prefecture
      t.string      :city
      t.string      :block
      t.string      :building
      t.timestamps
      t.datetime    :deleted_at
    end
  end
end
