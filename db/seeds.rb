require "csv"

CSV.foreach('db/csv/category.csv', headers: true) do |row|
  Category.create!(
    name: row['name'],
    parent_id: row['parent_id']
  )
end