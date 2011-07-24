# coding: utf-8   

class CategoriesController < ApplicationController
 
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

end
