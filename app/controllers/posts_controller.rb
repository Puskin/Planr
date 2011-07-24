# coding: utf-8

class PostsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :is_owner?, :only => [:edit, :update, :destroy]
  
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all     
    @user = current_user

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])  
    @categories = @post.categories

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new   
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])  
    @categories = Category.all
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post].merge(:user_id => current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Wpis utworzony z powodzeniem.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Wpis zaktualizowany z powodzeniem.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end 
  
 
 
  private 
  
  def is_owner?        
    @post = Post.find(params[:id])
    unless current_user.id == @post.user_id
      redirect_to(posts_path, :notice => 'Nie jesteś uprawniony do wykonania tej akcji')
    end
  end
  
end
