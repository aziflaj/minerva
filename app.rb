require 'yaml'
# require lib/*.rb and app/**/*.rb
Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each { |file| require file }

# Read the routes specified in the app/routes.yml file
ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), 'app', 'routes.yml')))
require_relative 'lib/router'

class App
  attr_reader :router

  def initialize
    @router = Router.new(ROUTES)
  end

  # Return the result of a web call based on the router resolvers
  def call(env)
    result = router.resolve(env)
    [result.status, result.headers, result.content]
  end

  class << self
    def root
      File.dirname(__FILE__)
    end
  end
end
