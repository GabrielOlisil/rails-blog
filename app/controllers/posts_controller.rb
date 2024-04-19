class PostsController < ApplicationController
  before_action :authenticate!, except: %i[index show]
  before_action :check_user, only: %i[edit destroy update]

  def index
    @posts = Post.order('created_at').page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    @username = User.find_by(id: @post.user_id).username

    @user_owner = user_owner?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :subtitle, :body)
  end

  def check_user
    return if user_owner?

    redirect_to @post
  end

  def user_owner?
    @post = Post.find(params[:id])

    @user = current_user

    return false unless @user

    return true if @user.id == @post.user_id

    false
  end
end
