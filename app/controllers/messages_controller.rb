class MessagesController < ApplicationController
  def create
    @space = Space.find(params[:space_id])
    @message = @space.messages.create(message_params)
    @message.user = current_user
    @message.save
    redirect_to @space
  end

  private

  def message_params
    params.require(:message).permit(
      :text
    )
  end
end
