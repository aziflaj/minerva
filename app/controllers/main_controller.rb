class MainController < Controller
  def index
    @project = 'Minerva'
    @children = %w[Michael Gordon Odin]
  end
end
