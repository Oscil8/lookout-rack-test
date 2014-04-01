require 'rack/test'
require 'lookout/rack/test'

module Lookout::Rack::Test::Cucumber
  module Server
    def app
      return @app if @app

      app_or_klass = ::Lookout::Rack::Test.app || $application_class
      @app = app_or_klass.respond_to?(:new) ? app_or_klass.new : app_or_klass
    end
  end
end

World(Lookout::Rack::Test::Cucumber)
