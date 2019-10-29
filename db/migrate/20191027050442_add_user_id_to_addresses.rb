class AddUserIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, foreign_key: true, null: false, type: :integer
  end
end
