class PostsController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
