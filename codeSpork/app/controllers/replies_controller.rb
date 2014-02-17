class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_filter :auth, except: [:create]

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # POST /replies
  # POST /replies.json
  def create
    @forum = Forum.find(params[:forum_id])
    @reply = @forum.replies.new(reply_params)
    @reply.user_id = current_user.id
    @forum.updated_at = Time.now
    @forum.save!

    respond_to do |format|
      if @reply.save
        format.html { redirect_to forum_path(@forum), notice: 'Reply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reply }
        original_poster = User.find(@forum.user_id)
        Usermailer.reply_notification(original_poster, current_user, forum_url(@forum)).deliver
      else
        format.html { redirect_to forum_path(@forum), notice: 'Reply was NOT created.' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url }
      format.json { head :no_content }
    end
  end

  private
  def auth
    authenticate_user! && current_user.admin?
    if !current_user.admin?
      redirect_to forums_path
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:answer, :user_id, :forum_id)
    end
end
