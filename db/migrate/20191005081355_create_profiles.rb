class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text        :body
      t.string      :last_name
      t.string      :first_name
      t.string      :last_name_kana
      t.string      :first_name_kana
      t.integer     :birth_year
      t.integer     :birth_month
      t.integer     :birth_day
      t.integer     :phone_number, unique: true
      t.timestamps
      t.datetime    :deleted_at
    end
  end
end
