class SerializerBase
  private_class_method :new

  protected

  def str_to_hash(str)
    raise NotImplementedError('Should be implemented in child')
  end

  def str_from_hash(hash_list)
    raise NotImplementedError('Should be implemented in child')
  end
end
