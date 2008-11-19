flex_build_dir = '../flex/bin'
flex_build_files = ['Main.swf', 'MainWithCoverflow.swf']

namespace :deploy do
  
  after "deploy:update_code", "deploy:push_flex_build"
  desc "copies all the flex built swfs to the web server"
  task :push_flex_build, :roles => :web do
    flex_build_files.each do |f|
      build_file = "#{flex_build_dir}/#{f}"
      logger.trace("uploading flex build file #{build_file}...")
      put(File.read(build_file), "#{current_release}/public/#{f}")
    end
  end

end

