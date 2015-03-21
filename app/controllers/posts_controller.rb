class PostsController <ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  @post = Post.new(post_params)
  @post.date = Time.now
    if @post.save
      flash[:notice] = "Post successfully added!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post successfully edited!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "Post deleted"
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :blog)
    end

end
