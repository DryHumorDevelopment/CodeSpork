class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_action :set_users
  before_filter :authenticate_user!

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all.order(:updated_at => :desc)
    @title = "All Forum Listings"
    @forum = Forum.new
  end

  def htmlcss
    @forums = Forum.where("tags like ?", "%html%").order(:updated_at => :desc)
    @title = "HTML/CSS Listings"
  end

  def responsive
    @forums = Forum.where("tags like ?", "%responsive%").order(:updated_at => :desc)
    @title = "Responsive Design Listings"
  end

  def vb
    @forums = Forum.where("tags like ?", "%vb%").order(:updated_at => :desc)
    @title = "VB.NET Listings"
  end

  def csharp
    @forums = Forum.where("tags like ?", "%csharp%").order(:updated_at => :desc)
    @title = "C# Listings"
  end

  def asp
    @forums = Forum.where("tags like ?", "%asp%").order(:updated_at => :desc)
    @title = "ASP.NET Listings"
  end

  def rb
    @forums = Forum.where("tags like ?", "%rb%").order(:updated_at => :desc)
    @title = "Ruby Listings"
  end

  def rails
    @forums = Forum.where("tags like ?", "%rails%").order(:updated_at => :desc)
    @title = "Ruby on Rails Listings"
  end

  def php
    @forums = Forum.where("tags like ?", "%php%").order(:updated_at => :desc)
    @title = "PHP Listings"
  end

  def js
    @forums = Forum.where("tags like ?", "%js%").order(:updated_at => :desc)
    @title = "JavaScript Listings"
  end

  def jq
    @forums = Forum.where("tags like ?", "%jq%").order(:updated_at => :desc)
    @title = "jQuery Listings"
  end

  def mobile
    @forums = Forum.where("tags like ?", "%mobile%").order(:updated_at => :desc)
    @title = "Mobile Development Listings"
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @reply = Reply.new
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
    if @forum.tags.include?("html") then params[:html_f] = true end
    if @forum.tags.include?("responsive") then params[:responsive_f] = true end
    if @forum.tags.include?("vb") then params[:vb_f] = true end
    if @forum.tags.include?("csharp") then params[:csharp_f] = true end
    if @forum.tags.include?("asp") then params[:asp_f] = true end
    if @forum.tags.include?("rb") then params[:rb_f] = true end
    if @forum.tags.include?("rails") then params[:rails_f] = true end
    if @forum.tags.include?("php") then params[:php_f] = true end
    if @forum.tags.include?("js") then params[:js_f] = true end
    if @forum.tags.include?("jq") then params[:jq_f] = true end
    if @forum.tags.include?("mobile") then params[:mobile_f] = true end
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = Forum.new(forum_params)
    @forum.user_id = current_user.id
    @forum.tags = if !params[:selected_tags].nil? then params[:selected_tags].join(",") end

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forum }
      else
        format.html { render action: 'new' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update

    @forum.tags = params[:selected_tags].join(",")
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url }
      format.json { head :no_content }
    end
  end

  private
    def set_users
      @users = User.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
      @user = User.find(@forum.user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:title, :question, :selected_tags, :user_id)
    end
end
