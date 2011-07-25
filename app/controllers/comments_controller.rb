class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment].merge(:user_id => current_user.id))
    respond_to do |format|
      format.html { redirect_to(@post, :notice => 'Dodano komentarz.') }
    end
  end
end
