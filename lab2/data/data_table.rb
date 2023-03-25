class DataTable
    private
  
    attr_accessor :table
    attr_writer :rows_count, :colums_count

    public
    
    attr_reader :rows_count, :colums_count
  
    def initialize(table)
      self.rows_count = table.size
      colums_count = 0
      if(table.first != nil) 
        colums_count = table.first.length()
      end
   
      table.each { |row| colums_count = row.size if row.size < colums_count }
      self.colums_count = colums_count
      self.table = table
    end
  
    
    def get_item(row, col)
      return nil if row >= rows_count
      return nil if col >= colums_count
  
      table[row][col].dup
    end
  
    def to_s
      "DataTable (#{rows_count}x#{colums_count})"
    end
end