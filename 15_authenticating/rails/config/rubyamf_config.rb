require 'app/configuration'
module RubyAMF
  module Configuration
    ClassMappings.translate_case = true
    ClassMappings.assume_types = true
    ClassMappings.register(:actionscript => 'User', :ruby => 'User', :type => 'active_record', :attributes=> ["email", "login"])
    ParameterMappings.scaffolding = true
  end
end