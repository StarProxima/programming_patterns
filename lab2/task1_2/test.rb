require_relative "student"

student1 = Student.new({ surname: '1', first_name: '2', patronymic: '3'})
student2 = Student.new({ surname: '3', first_name: '4', patronymic: '5', phine: '123'})

puts Student.valid_phone?('+7918673844488')
puts Student.valid_telegram?('mfewef')
puts Student.valid_email?('mfewef@yfa.ru')
puts Student.valid_git?('https://github.com/StarProxima')


student1.phone = '+79186733922'


puts student1.get_info()

# short_stud = Student_short.from_student(student1);
short_stud1 = Student_short.from_student(student1)
short_stud2 = Student_short.new(0, 'К.Г.Б.', 'git', 'contact')

Student.write_to_txt('students.txt', [student1, student2])
puts Student.read_from_txt('students.txt')


puts short_stud1
puts short_stud2

puts(student1)
puts(student2)