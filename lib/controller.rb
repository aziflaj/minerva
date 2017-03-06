class Controller
  attr_reader :name, :action
  attr_accessor :status, :headers, :content

  def initialize(name: nil, action: nil)
    @name = name
    @action = action
  end

  def call
    send(action)
    self.status = 200
    self.headers = { 'Content-Type' => 'text/html' }
    self.content = [template.render(self)]
    self
  end

  def template
    Tilt.new(File.join(App.root, 'app', 'views', name.to_s, "#{action}.html.erb"))
  end

  def not_found
    self.status = 404
    self.headers = {}
    self.content = ['Nothing found']
    self
  end

  def internal_error
    self.status = 500
    self.headers = {}
    self.content = ['Internal error']
    self
  end
end
