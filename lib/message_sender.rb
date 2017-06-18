class MessageSender
  def self.send_message(message)
    new.send_message(message)
  end

  def initialize
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    Rails.logger.debug("======== #{account_sid}  #{auth_token} ")
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(message)
    @client.account.messages.create(
      from:  twilio_number,
      to:    agent_number,
      body:  message
    )
  end

  private

  def twilio_number
    # A Twilio number you control - choose one from:
    # https://www.twilio.com/user/account/phone-numbers/incoming
    # Specify in E.164 format, e.g. "+16519998877"
    twilio_number = '+17867131642'
  end
  
  def agent_number
    # The sales rep / agent's phone number
    agent_number = '+13058785704'

    # This does not work, would be nice to pull phone number from current user
    # agent_number = "+1#{current_user.phone_number}"

end
