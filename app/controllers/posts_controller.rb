# Created by way of:
# rails g controller posts
class PostsController < ApplicationController
  def index # Load all Posts
    @posts = Post.order('created_at DESC')
  end # Automatically load the app/views/posts/index.html.erb
      # Rails will also hand off the @posts array of posts
      # to the view.

  def show # Show a specific post based on an id from the url.
    @post = Post.find(params[:id])
  end # Automatically load the app/views/posts/show.html.erb
end
