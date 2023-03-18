require_relative "data_table.rb"

table = DataTable.new([[1, 2], [3, 4]])

puts table.get_item(0,0)
puts table.get_item(1,1)

