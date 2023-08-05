class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def def create
    post = Post.new(content: params[ :content]) 
    post.save
    redirect_to("/post/index")
  end

  def new

  end

end
