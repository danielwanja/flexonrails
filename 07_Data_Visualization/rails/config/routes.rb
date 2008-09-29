ActionController::Routing::Routes.draw do |map|

  # NEW: added  :collection => {:positions_with_accounts 
  #      added  :member => {:history
  map.resources :accounts, :collection => {:positions_with_accounts => :get} do |account|
    account.resources :positions, :collection => {:buy => :post}, :member => {:history => :get} do |position|
      position.resources :movements
    end
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
