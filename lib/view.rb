require 'tilt/haml'

module View
  def render(context)
    layout = Tilt.new(File.join(App.root, 'app', 'views', 'layout', 'application.haml'))
    layout.render(context) do
      Tilt.new(File.join(App.root, 'app', 'views', context.name.to_s, "#{context.action}.haml"))
          .render(context)
    end
  end
end
