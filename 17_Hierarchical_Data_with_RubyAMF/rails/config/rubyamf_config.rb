require 'app/configuration'
module RubyAMF
  module Configuration
    ClassMappings.translate_case = true
    ParameterMappings.scaffolding = true
    ClassMappings.use_array_collection = true
    
    
    ClassMappings.register(
      :actionscript  => 'OutlinePoint',
      :ruby          => 'OutlinePoint',
      :type          => 'active_record',
      :associations  => ["parent"],
      :attributes    => ["id", "label", "created_at", "updated_at"],
      :methods       => ["children"] 
      )
    
  end
end