require_relative 'data_list'

class DataListStudentShort < DataList
  public_class_method :new

  def column_names
    %w[git contact last_name_and_initials]
  end

  protected

  def table_fields(obj)
    [obj.git, obj.contact, obj.last_name_and_initials]
  end
end