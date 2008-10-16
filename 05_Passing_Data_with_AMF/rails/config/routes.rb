ActionController::Routing::Routes.draw do |map|
  map.rubyamf_gateway 'rubyamf_gateway', :controller => 'rubyamf', :action => 'gateway'

  map.connect 'rubyamf_gateway', :controller => 'rubyamf', :action => 'gateway'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
