class PostsController < ApplicationController
  before_filter :authenticate_user!
 
 def test_input
 
 i = 0
  while(i<100)  
    @post = Post.new 
    @post.content = "This is the  No. " + i.to_s + " Happiness!"
    @post.count = 1
    @post.author = 'guest'
    @post.save
    i += 1
  end
  respond_to do |format|
          format.html  
          format.js
 end
 
 end
 
 def plus
    @post=Post.find(params[:id]);
    @post.count += 1
    @post.save
     
     respond_to do |format|
          format.html # index.html.erb
          format.js
    end
    
 end
 
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:per_page  => 10, :page => params[:page],   :order  =>  'count DESC'  )
    @post = Post.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.count = 1
    @post.author = 'guest'

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
