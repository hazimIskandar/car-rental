class MessageMailer < ApplicationMailer
	default :to => "zim1994.hi@gmail.com", subject: "Contact Car rental"
	def message_me(msg)
		@msg = msg
		mail from: @msg.email, body: @msg.content
	end
end
