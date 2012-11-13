class BlogController < ApplicationController
  def index
    @posts = Post.includes(:comments).order('created_at DESC')
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = @post.comments.build
  end
  
  def a
    if Post::ALLOWED_AWESOMENESS.include?(params[:level])
      @posts = Post.includes(:comments).
                    where(:awesomeness => params[:level]).
                    order('created_at DESC')
    else
      flash[:error] = "This category does not exist."
      redirect_to root_path
    end
  end
end
