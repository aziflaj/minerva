require 'tilt/erb'

module View
  def render(view: nil, base_template: nil)
    templates = [base_template, view]
    templates.inject(nil) do |prev, temp|
      _render(temp) { prev }
    end
  end

  def _render(&block)
    ERB.new(temp).result(binding)
  end
end
