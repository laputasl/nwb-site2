
map.root :controller => :home_page, :action => :show
map.customize "/customize", :controller => :home_page, :action => :customize

#needed for pagination
map.products "/products", :controller => :products, :action => :index

map.resources :orders,  :member => {:calculate_shipping => :get}, :collection => {:add_variant_only => [:post, :get]} do |order|
  order.resource :checkout, :member => {:set_shipping_method => :any}
end

map.connect "/add_to_cart", :controller=> 'orders', :action=>"add_variant_only"


map.namespace :admin do |admin|
   admin.resources :products, :member => {:additional_fields => :get}
   admin.resource  :suspicious_order_settings
   admin.resources :reports, :only => [:index, :show], :collection => {:sales_total => :get, :country_sales_by_quarter => :get}
end

map.category_taxon '/c/*path/:page', :controller => 'taxons', :action => 'show', :page => 1, :taxonomy => 'c'
map.brand_taxon '/b/*path/:page', :controller => 'taxons', :action => 'show', :page => 1, :taxonomy => 'b'
# map.feed '/feed/:feed.:format',  :controller => 'feeds', :action => 'show'
# map.feed '/feed(/:store)/:feed.:format',  :controller => 'feeds', :action => 'show'

map.connect '/inc/:segment', :controller => 'feeds', :action => 'includes', :conditions => { :method => :get }
map.connect '/feed/:feed.:format', :controller => 'feeds', :action => 'show', :conditions => { :method => :get }

