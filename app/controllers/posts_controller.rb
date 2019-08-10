class PostsController < Controller
  def index
    @posts = Post.all
  end

  def show
    @post = Post[1] # TODO: Remove magic 1
  end

  def new
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      # TODO: send to new post view
    else
      # TODO: redirect back with flash message
    end
  end

  private

  def post_params
    permitted_keys = %w[title content]
    request.params.select { |k, _| permitted_keys.include? k }
  end
end
