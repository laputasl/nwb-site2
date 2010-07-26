class StoreSweeper < ActiveRecord::Observer
  # This sweeper is going to keep an eye on the Product model
  observe Product

  # If our sweeper detects that a Product was created call this
  def after_create(product)
    expire_cache_for(product)
  end

  # If our sweeper detects that a Product was updated call this
  def after_update(product)
    expire_cache_for(product)
  end

  # If our sweeper detects that a Product was deleted call this
  def after_destroy(product)
    expire_cache_for(product)
  end

  private
  def expire_cache_for(product)
    # TODO expire Taxon pages.
    ProductsController.new.expire_page("/products/#{product.permalink}")

    product.taxons.each do |taxon|
      TaxonsController.new.expire_page("/#{taxon.permalink[0...-1]}")
    end

    unless (product.taxon_ids && [9998,3002]).empty?
      HomePageController.new.expire_page("/index")
    end
  end
end