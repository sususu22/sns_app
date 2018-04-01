class PostsController < ApplicationController

  def index

      @posts = Post.all
      @posts = Post.search(params[:search])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    @post = Post.new(posts_params)
    image = params[:posts][:image]
    @post.image_name = image.original_filename
    File.binwrite("public/post_images/#{image.original_filename}",image.read)
    @post.save
    redirect_to("/posts")
  end

  def update
    debugger
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    image = params[:posts][:image]
    @post.image_name = image.original_filename
    File.binwrite("public/post_images/#{image.original_filename}",image.read)
    @post.content = params[:content]
    @post.save
    redirect_to("/posts")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def destroy
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def posts_params
    params.require(:posts).permit(:title, :content)
  end

end
