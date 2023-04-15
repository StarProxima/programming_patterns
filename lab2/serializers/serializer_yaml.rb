require_relative 'serializer_base'
require 'yaml'

class SerializerYAML < SerializerBase
  public_class_method :new

  def str_to_hash(str)
    YAML.safe_load(str).map { |h| h.transform_keys(&:to_sym) }
  end

  def str_from_hash(hash_list)
    hash_list.map { |h| h.transform_keys(&:to_s) }.to_yaml
  end
end
