ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

begin
    require "bundler/setup" 
  rescue LoadError => e
    raise e unless ENV['RAILS_ENV'] == "production"
  end