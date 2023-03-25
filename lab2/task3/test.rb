require_relative "data/data_table"
require_relative "data/data_list_student_short"
require_relative "../models/student"
require_relative "../models/student_short"

table = DataTable.new([[1, 2], [3, 4]])

puts table.get_item(0,0)
puts table.get_item(1,1)

student1 = Student.new('Фамилия', 'Имя', 'Отчество', id: 0, git: 'git1', telegram: 'telegram1')
student2 = Student.new('Фамилия', 'Имя', 'Отчество', id: 1, git: 'git2')
short1 = StudentShort.from_student(student1)
short2 = StudentShort.from_student(student2)

short_list = DataListStudentShort.new([short1, short2])

short_table = short_list.data_table
puts short_table

short_list.select_element(1)
puts "#{short_list.selected_id}"

print 'id'.ljust(45)
short_list.column_names.each { |col_name| print col_name.ljust(45) }
puts

0.upto(short_table.rows_count - 1) do |row|
    0.upto(short_table.colums_count - 1) do |col|
      item = short_table.get_item(row, col)
      print item.to_s.ljust(45)
    end
    puts
end

0.upto(short_table.rows_count - 1) do |row|
    stud_info = {}
    1.upto(short_table.colums_count - 1) do |col|
      stud_info[short_list.column_names[col - 1].to_sym] = short_table.get_item(row, col)
    end
  
    my_student = StudentShort.new(short_table.get_item(row, 0), JSON.generate(stud_info))
    puts my_student
  end
  
  short_list.objects = []
  puts short_list.data_table