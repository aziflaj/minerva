require 'pry'
require_relative 'routes/helpers'

class BasicRouter
  include Routes::Helpers
  attr_reader :routes, :request

  def initialize
    @routes = []
  end

  def resolve(env)
    @request = Rack::Request.new(env)
    route_request(env)
  rescue StandardError => e
    puts e.message
    puts e.backtrace
    Controller.new.internal_error
  end

  def register(&block)
    raise 'No routes' unless block_given?

    instance_eval(&block)
  end

  private

  def route_request(env)
    path, method = env.values_at('REQUEST_PATH', 'REQUEST_METHOD')
    match = matched_route(path, method)
    raise Errors::BadRouteConfig, "#{path} is invalid" unless match

    controller, action = match.values_at(:controller, :action)
    return ctrl(controller, action).call if match # call the errors method if the path matches one of the routes

    Controller.new.not_found
  end

  def matched_route(path, method)
    routes.each do |route|
      next unless method == route[:method]

      q_keys = route[:path].scan /:\w+/
      p '#' * 90
      p route[:path]
      p q_keys
      p '#' * 90
    end
    routes.find { |r| Regexp.new("^#{r[:path]}$").match?(path) && method == r[:method] }
  end

  def ctrl(ctrl_name, action_name)
    klass = Object.const_get "#{ctrl_name.capitalize}Controller"
    klass.new(name: ctrl_name, action: action_name.to_sym, request: request)
  end
end
