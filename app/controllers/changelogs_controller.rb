class ChangelogsController < ApplicationController
  before_action :set_changelog, only: [:show, :edit, :update, :destroy]

  # GET /changelogs
  # GET /changelogs.json
  def index
    @changelogs = Changelog.all
  end

  # GET /changelogs/1
  # GET /changelogs/1.json
  def show
  end

  # GET /changelogs/new
  def new
    @changelog = Changelog.new
  end

  # GET /changelogs/1/edit
  def edit
  end

  # POST /changelogs
  # POST /changelogs.json
  def create
    @changelog = Changelog.new(changelog_params)
    @changelog.user = current_user.user_name
    @changelog.date = Time.now.strftime "%m-%d-%Y"
    respond_to do |format|
      if @changelog.save
        format.html { redirect_to @changelog, notice: 'Changelog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @changelog }
      else
        format.html { render action: 'new' }
        format.json { render json: @changelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changelogs/1
  # PATCH/PUT /changelogs/1.json
  def update
    respond_to do |format|
      if @changelog.update(changelog_params)
        format.html { redirect_to @changelog, notice: 'Changelog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @changelog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /changelogs/1
  # DELETE /changelogs/1.json
  def destroy
    @changelog.destroy
    respond_to do |format|
      format.html { redirect_to changelogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_changelog
      @changelog = Changelog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def changelog_params
      params.require(:changelog).permit(:user, :content, :date)
    end
end
