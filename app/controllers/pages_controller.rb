class PagesController < Controller
  def welcome
    @project = 'Minerva'
    @children = %w[Michael Gordon Odin]
  end
end
