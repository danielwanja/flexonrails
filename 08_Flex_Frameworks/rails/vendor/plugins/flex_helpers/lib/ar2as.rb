require "config/environment"
require "erb"
require "string"

MODEL_DIR     = File.join(RAILS_ROOT, "app/models")
TEMPLATE_DIR  = File.join(File.dirname(__FILE__), "../templates")

TYPE_TRANSLATION_MAP = {:decimal => :Number, :integer => :int, :string => :String, :text => :String, :datetime => :Date, :date => :Date, :boolean => :Boolean}

module AR2AS

  def self.get_vo_contents(klass, schema_version, options)

    package = options.package_name
    camel   = options.camel_case
    attributes = {}
    klass.columns.each do |col|
      col_type = col.type.to_s
      attribute_name = camel ? col.name.dup.to_camel! : col.name
      attributes[attribute_name] = TYPE_TRANSLATION_MAP[col.type] unless col.name =~ /_id$/ #exclude foreign keys, expecting them to be picked up in associations
    end
    
    associations = {}
    klass.reflections.each do |name, reflection|
      type = case reflection.macro
      when :has_one, :belongs_to, :composed_of
        reflection.klass.name
      when :has_many, :has_many_and_belongs_to
        :Array
      end
      association_name = camel ? name.to_s.to_camel! : name
      associations[association_name] = type
    end
    
    vo_template = ERB.new(File.read(File.join(TEMPLATE_DIR, 'vo.erb')))
    vo_template.result(binding)
  end

  def self.create_vo(klass, schema_version, options)
    package_dir = options.package_name.tr('.', '/')
    vo_dir = "#{options.src_dir}/#{package_dir}"
    FileUtils.mkdir_p vo_dir
    vo_file_name = File.join(vo_dir, klass.name.camelize + ".as")
    if (File.exist?(vo_file_name) && !options.overwrite)
      puts "not overwriting #{vo_file_name}"
    else
      vo_contents = get_vo_contents(klass, schema_version, options)
      puts "writing #{vo_file_name}"
      File.open(vo_file_name, "w") { |f| f.puts vo_contents }
    end
  end

  def self.get_model_names(models)
    return models unless models.empty?
    Dir.chdir(MODEL_DIR) do
      return Dir["**/*.rb"]
    end
  end
  
  def self.create_vos(options)
    version = ActiveRecord::Migrator.current_version rescue 0
    
    self.get_model_names(options.models).each do |m|
      class_name = m.sub(/\.rb$/,'').camelize
      begin
        klass = class_name.split('::').inject(Object){ |klass,part| klass.const_get(part) }
        if klass < ActiveRecord::Base && !klass.abstract_class?
          self.create_vo(klass, version, options)
        else
          puts "Skipping #{class_name}"
        end
      rescue Exception => e
        puts "Unable to create #{class_name}: #{e.message}"
      end
      
    end
  end
end
