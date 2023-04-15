class DataList
    private_class_method :new

    private
  
    attr_reader :objects
    attr_accessor :selected_num

    public
  
    attr_writer :objects
  
    def initialize(objects)
      self.objects = objects
    end
  
    def select_element(number)
      self.selected_num = number < objects.size ? number : nil
    end
  
    def selected_id
      objects[selected_num].id
    end
  
    def data_table
      result = []
      counter = 0
      objects.each do |obj|
        row = []
        row << counter
        row.push(*table_fields(obj))
        result << row
        counter += 1
      end
      DataTable.new(result)
    end
  
    def append(*objects)
      self.objects.append(*objects)
    end

    def replace_objects(objects)
      self.objects = objects.dup

    end
  
    protected
  
    # Список значений полей для DataTable. Переопределить в наследниках
    def table_fields(_obj)
        raise NotImplementedError, "Метод не реализован"
    end
  
    # Имена атрибутов объектов по порядку. Переопределить в наследниках
    def column_names
        raise NotImplementedError, "Метод не реализован"
    end
end