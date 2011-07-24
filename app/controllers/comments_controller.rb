class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment].merge(:user_id => current_user.id))
    redirect_to @post
    flash[:notice] = "Dodano komentarz"
  end
end
