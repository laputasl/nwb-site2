module Spree::MultiStore::BaseControllerOverrides
  def self.included(controller)
    controller.prepend_before_filter :set_layout, :load_global_taxons
    controller.helper :products, :taxons
    controller.helper_method :page_will_be_cached?, :cached_pages
    controller.after_filter :write_flash_to_cookie
    controller.alias_method_chain :cache_page, :site
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

    set_customizer_cookies

    true if actions.include? @current_action.downcase.to_sym
  end


  def write_flash_to_cookie
    cookie_flash = cookies['flash'] ? JSON.parse(cookies['flash']) : {}

    flash.each do |key, value|
      if cookie_flash[key.to_s].blank?
        cookie_flash[key.to_s] = value
      else
        cookie_flash[key.to_s] << "<br/>#{value}"
      end
    end

    cookies['flash'] = cookie_flash.to_json
    flash.clear
  end

  def set_customizer_cookies
    # store cookie values so they are always there
    cookies[:authenticity_token] = session[:_csrf_token] ||= ActiveSupport::SecureRandom.base64(32)
    cookies[:current_user_id] = current_user.try(:id)
  end

  #stores cached pages in multi-store aware manner
  def cache_page_with_site(content = nil, options = nil)
    path = case options
      when Hash
        url_for(options.merge(:only_path => true, :skip_relative_url_root => true, :format => params[:format]))
      when String
        options
      else
        request.path
    end

    if path == "/" || path.blank?
      path = request.env["REQUEST_PATH"] == "/" ? "/index" : request.env["REQUEST_PATH"]
    end

    path = "/cache/#{request.host}" << path

    cache_page_without_site(content, path)
  end

end