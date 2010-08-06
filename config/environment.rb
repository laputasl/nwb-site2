# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
SPREE_GEM_VERSION = '0.10.99' unless defined? SPREE_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Spree::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on.
  # They can then be installed with "rake gems:install" on new installations.
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "aws-s3", :lib => "aws/s3"

  config.gem "highline", :version => '1.5.1'
  config.gem 'authlogic', :version => '2.1.3'
  config.gem 'authlogic-oid', :lib => "authlogic_openid", :version => '1.0.4'
  config.gem "activemerchant", :lib => "active_merchant", :version => '1.7.0'
  config.gem 'activerecord-tableless', :lib => 'tableless', :version => '0.1.0'
  config.gem 'less', :version => '1.2.20'
  config.gem 'stringex', :lib => 'stringex', :version => '1.0.3'
  config.gem 'chronic', :version => '0.2.3'
  config.gem 'whenever', :lib => false, :version => '0.3.7'
  config.gem 'searchlogic', :version => '2.3.5'
  config.gem 'will_paginate', :lib => 'will_paginate', :version => '2.3.14'
  config.gem 'state_machine', :lib => 'state_machine', :version => '0.9.2'
  config.gem "faker", :version => '0.3.1'
  config.gem 'paperclip', :version => '>=2.3.1.1'
  config.gem 'refraction', :version => '0.2.0'
  config.gem 'exceptional', :version => '2.0.9'
  config.gem 'ruby-openid', :lib => "openid", :version => '>=2.0.4'

  # Only load the plugins named here, in the order given. By default, all plugins
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  config.plugins = [ :all, :resource_controller, :extension_patches ]

  # Define SPREE_EXTENSIONS_LOAD_ORDER in config/preinitializer.rb if you want to
  # specify a custom extension load order.  You may have to create preinitializer.rb
  # yourself, this is an optional Spree file. For example:
  # SPREE_EXTENSIONS_LOAD_ORDER = [:theme_default, :all, :site]
  # For more details see http://railsdog.lighthouseapp.com/projects/31096/tickets/595

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = "Pacific Time (US & Canada)"

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
  config.active_record.observers = :state_monitor, :store_sweeper

  # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
  # All files from config/locales/*.rb,yml are added automatically.
  #config.i18n.load_path << Dir[File.join(RAILS_ROOT, 'my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :'en'

end

Time::DATE_FORMATS[:date_time24] = "%Y-%m-%d %H:%M"
Time::DATE_FORMATS[:short_date] = "%Y-%m-%d"

# Add new inflection rules using the following format
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register "application/x-mobile", :mobile

# Include your application configuration below

### global variables for gwo test
#==================================NWB=========================================
#*** Background Test
#NWB_GLOBAL_TEST_EID = "3063478576" # local background
#NWB_GLOBAL_TEST_EID = "2328395807" # staging background

#*** Seal Test
#NWB_GLOBAL_TEST_EID = "2081050742" # local seal
#NWB_GLOBAL_TEST_EID = "2990546235" # staging seal

#*** Seal Position Test
#NWB_GLOBAL_TEST_EID = "1306119896" # local seal position
NWB_GLOBAL_TEST_EID = "2984633207" # staging seal position

#*** "FREE Shipping" Text Test
#NWB_GLOBAL_TEST_EID = "3509091458" # local "FREE Shipping" text
#NWB_GLOBAL_TEST_EID = "2466158139" # staging "FREE Shipping" text

#*** Javascript Sections number / domian name / PID
NWB_GLOBAL_TEST_JS_COUNT = 0
NWB_DOMAIN_NAME = ".naturalwellbeing.com"
#NWB_GLOBAL_TEST_PID = "UA-16618505-1" # local PID
NWB_GLOBAL_TEST_PID = "UA-981819-14" # staging PID


#==================================PWB=========================================
#*** Banner Test
#PWB_GLOBAL_TEST_EID = "0640388639" # local banners
#PWB_GLOBAL_TEST_EID = "3906587456"  # staging banners

#*** Product Headline Font Size Test
#PWB_GLOBAL_TEST_EID = "0470403630" # local product headline font size
#PWB_GLOBAL_TEST_EID = "2150907440" # staging product headline font size

#*** Background Test
#PWB_GLOBAL_TEST_EID = "0091113658" # local background
#PWB_GLOBAL_TEST_EID = "0791631371" # staging background

#*** "In Stock" Test
#PWB_GLOBAL_TEST_EID = "2833583559" # local in-stock
PWB_GLOBAL_TEST_EID = "0595081569" # staging in-stock

#*** Product Headline Test
#PWB_GLOBAL_TEST_EID = "2485823474" # local product headline
#PWB_GLOBAL_TEST_EID = "2743444894"  # staging product headline

#*** Product Headline Font Family Test
#PWB_GLOBAL_TEST_EID = "0173452456" # local product headline font family
#PWB_GLOBAL_TEST_EID = ""  # staging product headline font family

#*** Javascript Sections number / domian name / PID
PWB_GLOBAL_TEST_JS_COUNT = 0
PWB_DOMAIN_NAME = ".petwellbeing.com"
#PWB_GLOBAL_TEST_PID = "UA-16618505-1" # local PID
PWB_GLOBAL_TEST_PID = "UA-981819-14" # staging PID
