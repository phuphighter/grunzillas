class CommentsController < ApplicationController
  before_filter :require_user, :only => [:destroy]

  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.paginate :page => params[:page], :order => 'id DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new(params[:comment])
#    @comment = Comment.new

    render :update do |page|
      page.insert_html :bottom, 'comments', :partial => 'comment', :locals => {:comment => @comment}
      page.visual_effect :highlight, 'comments', :duration => 2
      page[:comment_form].reset
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])

    render :update do |page|
      if @comment.save
        page.insert_html :top, 'comments', :partial => 'comment', :locals => {:comment => @comment}
        page.visual_effect :highlight, 'comments', :duration => 2
        page[:comment_form].reset
      else
        page.alert("Hey Dumbass! Something's wrong with your name, email, or comment.")
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
