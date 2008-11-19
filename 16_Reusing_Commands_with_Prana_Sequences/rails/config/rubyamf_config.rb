require 'app/configuration'
module RubyAMF
  module Configuration
    ClassMappings.translate_case = true
    ClassMappings.use_array_collection = true
    ParameterMappings.scaffolding = true
  
    ClassMappings.register(
      :actionscript  => 'User',
      :ruby          => 'User',
      :type          => 'active_record',
      :attributes    => ["id", "login", "email", "created_at", "updated_at"])
      
    ClassMappings.register(
      :actionscript  => 'Note',
      :ruby          => 'Note',
      :type          => 'active_record',
      :attributes    => ["id", "content", "title", "user_id", "created_at", "updated_at"])
    
  end
end