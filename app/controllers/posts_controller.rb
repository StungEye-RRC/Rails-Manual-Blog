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
  
  def edit # Show a specific post within an HTML form.
    @post = Post.find(params[:id]) # Single Post Object.
  end # Automatically load the app/views/posts/edit.html.erb
  
  def update # Update a specific post.
    @post = Post.find(params[:id]) # Single Post Object.
    # Uses the form data from the edit form to
    # update the @post variable. The form data
    # will be in the params hash.
    
    # These three lines can be replaced with
    # update_attributes below.
    # @post.title = params[:post][:title]
    # @post.body  = params[:post][:body]
    # if @post.save # Save back to the posts table in the db.
    
    if @post.update_attributes(params[:post])
      # If the validations pass and the post is saved,
      # redirect to the show action for this post.
      redirect_to :action => :show, :id => @post
    else
      # If the save fails, meaning the validations fail,
      # use the view associated with the edit action to
      # re-display the edit form for this @post.
      render :action => :edit
    end
  end # No associated view: redirects or renders.
  
  def destroy # Destroy a specific post by id.
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :action => :index
  end # No associated view: redirect to the index action.
  
  def new # Show an empty form to create a new post.
    @post = Post.new
  end # Automatically load the app/views/posts/new.html.erb
  
  def create # Creates a new post with data from the 'new'
             # action form.
    @post = Post.new(params[:post])
    
    if @post.save
      redirect_to :action => :show, :id => @post
    else
      render :action => :new
    end
  end # No associated views: redirects or renders
end

