class AddUserIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :user, foreign_key: true, null: false, type: :integer
  end
end
