class Router
  attr_reader :routes, :request

  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    @request = Rack::Request.new(env)
    route_request(env)
  rescue StandardError => e
    puts e.message
    puts e.backtrace
    Controller.new.internal_error
  end

  private

  def route_request(env)
    path = env['REQUEST_PATH']
    match = routes.find { |k, _| Regexp.new("^#{k}$").match? path }
    return ctrl(match.last).call if match # call the errors method if the path matches one of the routes

    Controller.new.not_found
  end

  def ctrl(route)
    ctrl_name, action_name = route.split('#')
    klass = Object.const_get "#{ctrl_name.capitalize}Controller"
    klass.new(name: ctrl_name, action: action_name.to_sym, request: request)
  end
end
