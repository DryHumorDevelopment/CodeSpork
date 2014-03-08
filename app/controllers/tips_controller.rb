class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  #before_filter :auth, except: [:index, :show]
  #before_action :set_users
  #before_filter :authenticate_user!

  # GET /tips
  # GET /tips.json
  def index
    @users = User.all
    @tips = Tip.all.order(:updated_at => :desc)
    @title = "All Tips Listings"
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(tip_params)
    @tip.user_id = current_user.id

    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tip }
      else
        format.html { render action: 'new' }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url }
      format.json { head :no_content }
    end
  end

  private
    #def auth
    #  authenticate_user! && current_user.admin?
    #  if !current_user.admin?
    #    redirect_to tips_path
    #  end
    #end
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id])
      @user = User.find_by_id(@tip.user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:title, :description, :code, :user_id)
    end
end
