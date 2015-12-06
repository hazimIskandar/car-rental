class MessagesController < ApplicationController
  

  def new
  	@message = Message.new
  end

  def create
  	@message = Message.new(message_params)
  	if @message.valid?
  		MessageMailer.message_me(@message).deliver_now
  		redirect_to root_path, notice: "Thankyou for your message."
  	else
  		render 'landing_pages/index'
  	end
  end

  private
  def message_params
  	params.require(:message).permit(:name, :email, :content)
  end
end
