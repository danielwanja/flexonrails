class AR2ASOptions

  attr_accessor :models
  attr_accessor :src_dir
  attr_accessor :package_name
  attr_accessor :camel_case
  attr_accessor :include_parents
  attr_accessor :overwrite
  
  def initialize
    @models                 = []
    @src_dir                = '.'
    @package_name           = ''
    @camel_case             = true
    @include_parents        = true
    @overwrite              = false
  end
  
  def to_s
    s = ''
    instance_variables.each do |variable|
      s << "#{variable} = #{eval(variable).inspect}\n"
    end
    s
  end

end