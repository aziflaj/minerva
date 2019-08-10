require_relative 'errors/not_found_error'

class Controller
  include View
  attr_reader :name, :action, :request
  attr_accessor :status, :headers, :content

  def initialize(name: nil, action: nil, request: nil)
    @name = name
    @action = action
    @request = request
  end

  def call
    send(action)
    self.status ||= 200
    self.headers ||= { 'Content-Type' => 'text/html' }
    self.content ||= [render(self)]
    self
  rescue Errors::RecordNotFound
    not_found
  end

  def redirect_to(path)
    self.status = 302
    self.headers = { 'Location' => path }
    self.content = []
    self
  end

  def not_found
    self.status = 404
    self.headers = {}
    self.content = [render_error(404)]
    self
  end

  def internal_error
    self.status = 500
    self.headers = {}
    self.content = [render_error(500)]
    self
  end
end
