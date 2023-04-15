# frozen_string_literal: true

require './LabStudents/models/student'
require './LabStudents/models/student_short'
require './LabStudents/repositories/containers/data_list_student_short'

class FileDataSource
  attr_writer :serializer

  def initialize(serializer)
    self.students = []
    self.seq_id = 1
    self.serializer = serializer
  end

  def load_from_file(file_path)
    hash_list = serializer.str_to_hash(File.read(file_path))
    self.students = hash_list.map { |h| Student.from_hash(h) }
    update_seq_id
  end

  def save_to_file(file_path)
    hash_list = students.map(&:to_hash)
    File.write(file_path, serializer.str_from_hash(hash_list))
  end

  def student_by_id(student_id)
    students.detect { |s| s.id == student_id }
  end

  def paginated_short_students(page, count, existing_data_list = nil)
    offset = (page - 1) * count
    slice = students[offset, count].map { |s| StudentShort.from_student(s) }

    return DataListStudentShort.new(slice) if existing_data_list.nil?

    existing_data_list.replace_objects(slice)
    existing_data_list
  end

  def sorted
    students.sort_by(&:last_name_and_initials)
  end

  def add_student(student)
    student.id = seq_id
    students << student
    self.seq_id += 1
    student.id
  end

  def replace_student(student_id, student)
    idx = students.find_index { |s| s.id == student_id }
    students[idx] = student
  end

  def remove_student(student_id)
    students.reject! { |s| s.id == student_id }
  end

  def student_count
    students.count
  end

  private

  def update_seq_id
    self.seq_id = students.max_by(&:id).id + 1
  end

  attr_reader :serializer
  attr_accessor :students, :seq_id
end
