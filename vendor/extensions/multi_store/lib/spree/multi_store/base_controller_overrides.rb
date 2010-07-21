module Spree::MultiStore::BaseControllerOverrides
  def self.included(controller)
    controller.prepend_before_filter :set_layout, :load_global_taxons
    controller.helper :products, :taxons
    controller.helper_method :page_will_be_cached?, :cached_pages
  end


  private

  # Tell Rails to look in layouts/#{@site} whenever we're inside of a store (instead of the standard /layouts location)
  def find_layout(layout, format, html_fallback=false) #:nodoc:
    layout_dir = @current_domain ? "layouts/#{@current_domain}" : "layouts"
    view_paths.find_template(layout.to_s =~ /\A\/|layouts\// ? layout : "#{layout_dir}/#{layout}", format, html_fallback)
  rescue ActionView::MissingTemplate
    raise if Mime::Type.lookup_by_extension(format.to_s).html?
  end

  def set_layout
    @site ||= Store.find(:first, :conditions => {:code => request.headers['wellbeing-site']})
    @current_domain = request.headers['wellbeing-domain']
  end

  def get_taxonomies
    @taxonomies ||= Taxonomy.find(:all, :include => {:root => :children}, :conditions => ["store_id = ?", @site.id])
    @taxonomies
  end

  def load_global_taxons
    @categories = Taxonomy.find(:first, :conditions => {:store_id => @site.id, :name => "Category"})
  end


  def cached_pages
    {
      :home_page  => [:show],
      :products   => [:index, :show],
      :taxons     => [:show]
    }
  end

  #used to decide if user specific information regarding cart should be included (or left to cookies/js to update)
  def page_will_be_cached?
    return false unless actions = cached_pages[@current_controller.downcase.to_sym]

    if actions.include? @current_action.downcase.to_sym
      cookies[:authenticity_token] = session[:_csrf_token]
      cookies[:current_user_id] = current_user.try(:id)
      true
    end
  end
end