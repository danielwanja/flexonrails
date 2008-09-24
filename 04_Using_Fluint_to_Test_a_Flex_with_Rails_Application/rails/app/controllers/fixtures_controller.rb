if RAILS_ENV == "test"
  require 'active_record/fixtures'
  
  class FixturesController < ApplicationController
    
    def reset
      table_names = params[:fixtures][:fixture]
      Fixtures.reset_cache
      Fixtures.create_fixtures("#{RAILS_ROOT}/test/fixtures/", table_names, {})
      render :xml => "<status>ok</status>" 
    end
    
    def crossdomain
      render :text => <<-EOXML
<?xml version="1.0"?>
<!DOCTYPE cross-domain-policy SYSTEM "http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd">
<cross-domain-policy>
   <allow-access-from domain="*" />
</cross-domain-policy>
      EOXML
    end
    
    RESULTS_FILE = File.join(RAILS_ROOT, '..', 'flex', 'bin-debug', 'test_results.txt')
    def test_results
      File.open(RESULTS_FILE, 'w') { |f| f.write params['testsuites'].to_xml(:root => 'testsuites') }
      head :ok
    end
  end
  
end #if test