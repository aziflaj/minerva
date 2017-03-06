require 'tilt/erb'

module View
  def render(context)
    layout = Tilt.new(File.join(App.root, 'app', 'views', 'layout', 'application.html.erb'))
    layout.render(context) do
      Tilt.new(File.join(App.root, 'app', 'views', context.name.to_s, "#{context.action}.html.erb"))
          .render(context)
    end
  end
end
