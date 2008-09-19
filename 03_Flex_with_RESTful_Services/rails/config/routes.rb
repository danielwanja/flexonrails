ActionController::Routing::Routes.draw do |map|

  map.resources :accounts do |account|
    account.resources :positions, :collection => {:buy => :post} do |position|
      position.resources :movements
    end
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
