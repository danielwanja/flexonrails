namespace :flex do

  desc "Reads all Models and outputs AS3 VOs with similar attributes."
  task :ar2as do
      require File.join(File.dirname(__FILE__), "../lib/ar2as.rb")
      require File.join(File.dirname(__FILE__), "../lib/ar2as_options.rb")
      
      options = AR2ASOptions.new
      options.models            = ENV['models'].split(',') if ENV['models']
      options.src_dir           = ENV['src_dir'] if ENV['src_dir']
      options.package_name      = ENV['package_name'] if ENV['package_name']
      options.camel_case        = (ENV['camel_case'] == 'true') if ENV['camel_case']
      options.include_parents   = (ENV['include_parents'] == 'true') if ENV['include_parents']
      options.overwrite         = (ENV['overwrite'] == 'true') if ENV['overwrite']
      puts "using options:"
      puts options.to_s
      AR2AS.create_vos(options)
  end
  
  desc "Shows usage of all flex helper tasks"
  task :help do
    puts File.read(File.join(File.dirname(__FILE__), "../README"))
  end
  
end