namespace :db do
  
  namespace :fixtures do
    desc 'Create YAML test fixtures from data in an existing database.  
    Defaults to development database. Set RAILS_ENV to override.'
    task :extract => :environment do
      sql = "SELECT * FROM %s"
      skip_tables = ["schema_info", "schema_migrations", "sessions"]
      ActiveRecord::Base.establish_connection
      tables = ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : ActiveRecord::Base.connection.tables - skip_tables
      tables.each do |table_name|
        puts "Reading table: #{table_name}"
        i = "000"
        f = "#{RAILS_ROOT}/test/fixtures/#{table_name}.yml"
        puts "Writing to #{f}"
        File.open(f, 'w') do |file|
          data = ActiveRecord::Base.connection.select_all(sql % table_name)
          file.write data.inject({}) { |hash, record|
            hash["#{table_name}_#{i.succ!}"] = record
            hash
          }.to_yaml
        end
      end
    end
  end

end