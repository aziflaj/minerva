require_relative 'lib/boot'
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

    def env
      case ENV['RACK_ENV']
      when 'production'
        'production'
      else
        'development'
      end
    end

    def production?
      App.env == 'production'
    end
  end
end
