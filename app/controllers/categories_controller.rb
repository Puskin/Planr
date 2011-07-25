# coding: utf-8   

class CategoriesController < ApplicationController
  
  before_filter :admin_user, :only => [:new] 
 
  def index
    @categories = Category.all    
  end

  def show     
    @category = Category.find(params[:id])   
    @posts = @category.posts

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category } 
    end  
  end
 
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  def edit
  
  end

  # POST /posts
  # POST /posts.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Utworzono kategorię.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end     
  
  
  private
  
      def admin_user
        redirect_to(categories_path, :notice => 'Nie masz uprawnień!') unless current_user.admin?
      end

end
