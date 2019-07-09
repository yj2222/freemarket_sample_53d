require "csv"

CSV.foreach('db/categories.csv', headers: true) do |row|
  Category.create(
    id: row['id'],
    grandchild: row['grandchild'],
    child: row['child'],
    parent: row['parent'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end
