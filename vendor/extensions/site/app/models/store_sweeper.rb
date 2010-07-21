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
  def expire_cache_for(record)
    # TODO expire Taxon pages.
    ProductsController.new.expire_page("/products/#{record.permalink}")
  end
end