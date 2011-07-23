# coding: utf-8

class UsersController < ApplicationController

  before_filter :current_user?, :only => [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = Post.where(:user_id => @user.id)                 
  end 
  
  def edit
    @user = User.find(params[:id])    
  end       
  
  private 
  
  def current_user?
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to(posts_path, :notice => 'Nie jesteś uprawniony do wykonania tej akcji')
    end   
  end
  

end