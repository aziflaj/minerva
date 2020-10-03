module Routes
  module Helpers
    def root(controller_action)
      @routes << map_method(:get, '/', to: controller_action)
    end

    def get(*args)
      @routes << map_method(:get, *args)
    end

    def post(*args)
      @routes << map_method(:post, *args)
    end

    def put(*args)
      @routes << map_method(:put, *args)
    end

    private

    def map_method(method, path, options = {})
      raise Errors::BadRouteConfig, "#{path} is invalid" if options.empty?

      controller, action = options[:to].split('#')
      { path: path, controller: controller, action: action, method: method.to_s.upcase }
    end
  end
end
