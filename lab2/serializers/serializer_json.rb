require_relative 'serializer_base'
require 'json'

class SerializerJSON < SerializerBase
  public_class_method :new

  def str_to_hash(str)
    JSON.parse(str, { symbolize_names: true })
  end

  def str_from_hash(hash_list)
    JSON.pretty_generate(hash_list)
  end
end
