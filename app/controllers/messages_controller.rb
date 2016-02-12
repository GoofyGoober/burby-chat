class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def ask_new_message
    @messages = Message.all
    id = @messages.last.id
    if id == params[:last_message_id].to_i
      render plain: 'no'      
    else
      render 'replace_content', format: :js, layout: false
    end
  end

  # GET /messages
  def index
    @message = Message.new
    @messages = Message.all
  end

  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @messages = Message.all
    @message = Message.new(message_params)
    @message.user_id = session[:user]["id"]

    if @message.save
      redirect_to messages_url, notice: 'Message was successfully created.'
    else
      render :index
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:user_id, :content)
    end
end
