# Created by way of:
# rails g controller posts
class PostsController < ApplicationController
  # This filter ensures that the @post variable will be located
  # using the params[:id] before the show, edit, update and
  # destroy actions are executed. See the load_post_by_id
  # method at the bottom of the file.
  before_filter :load_post_by_id,
                :only => [:show, :edit, :update, :destroy]

  # This filter ensures that for all actions other than index
  # and show we authenticate the user by way of the require_sudo
  # method found in the application_controller.rb file.
  before_filter :require_sudo
  
  def index # Load all Posts
    @posts = Post.includes(:comments).order('created_at DESC')
  end # Automatically load the app/views/posts/index.html.erb
      # Rails will also hand off the @posts array of posts
      # to the view.

  def show # Show a specific post based on an id from the url.
    # Empty, since the @post object is loaded by way of a before filter.
    @comment = @post.comments.build
  end # Automatically load the app/views/posts/show.html.erb
  
  def edit # Show a specific post within an HTML form.
    # Empty, since the @post object is loaded by way of a before filter.
  end # Automatically load the app/views/posts/edit.html.erb
  
  def update # Update a specific post.
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
  
  
  protected
  
  def load_post_by_id
    @post = Post.includes(:comments).find(params[:id])
  end
end

