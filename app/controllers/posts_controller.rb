class PostsController < Controller
  def index
    @posts = Post.all
  end

  def show
    id = request.env['REQUEST_URI'].split('/').last
    @post = Post[id]
    raise Errors::RecordNotFound unless @post
  end

  def new
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save
      redirect_to "/posts/#{post.id}"
    else
      redirect_to '/posts' # TODO: add a flash message
    end
  end

  private

  def post_params
    permitted_keys = %w[title content]
    request.params.select { |k, _| permitted_keys.include? k }
  end
end
