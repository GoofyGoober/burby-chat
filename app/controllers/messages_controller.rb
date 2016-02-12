class MessagesController < ApplicationController
  before_action :set_user
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def ask_new_message
    @messages = Message.all
    id = @messages.last.id
    
    return head :ok if id == params[:last_message_id].to_i
    render 'replace_content', format: :js, layout: false
  end

  # GET /messages
  def index
    redirect_to '/users/new' if session[:user].blank?
    @message = Message.new
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  def create
    @messages = Message.all
    @message = Message.new(message_params)
    @message.user = @user
    @message.save
    render format: :js, layout: false
  end

  private
  def set_user
    @user = User.find(session[:user]["id"])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id, :content)
    end
end
