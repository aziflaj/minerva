class Router
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

  def register
    yield self
  end

  def root(controller_action)
    controller, action = controller_action.split('#')
    @routes << { path: '/', controller: controller, action: action, method: 'GET' }
  end

  def get(path, options = {})
    raise Errors::BadRouteConfig, "#{path} is invalid" if options.empty?

    controller, action = options[:to].split('#')
    @routes << { path: path, controller: controller, action: action, method: 'GET' }
  end

  def post(path, options = {})
    raise Errors::BadRouteConfig, "#{path} is invalid" if options.empty?

    controller, action = options[:to].split('#')
    @routes << { path: path, controller: controller, action: action, method: 'POST' }
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
    routes.find { |r| Regexp.new("^#{r[:path]}$").match?(path) && method == r[:method] }
  end

  def ctrl(ctrl_name, action_name)
    klass = Object.const_get "#{ctrl_name.capitalize}Controller"
    klass.new(name: ctrl_name, action: action_name.to_sym, request: request)
  end
end
