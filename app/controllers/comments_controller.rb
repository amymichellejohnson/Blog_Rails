class CommentsController <ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { flash[:notice] = "Comment successfully added!"
        redirect_to post_path(@post)}
        format.js
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = "Failure."
          render :new }
        format.js {
          render 'error'}
      end
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully edited!"
      redirect_to post_path(@post)
    else
      render:edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = "Comment deleted"
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
