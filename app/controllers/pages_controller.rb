class PagesController < ApplicationController
  def home
  end

  def sms
    #byebug
    #raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
    require 'twilio-ruby'

    account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/user/account
    auth_token = ENV['TWILIO_AUTH_TOKEN']   # Your Auth Token from www.twilio.com/user/account

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.account.messages.create(
      from: ENV['FROM_PHONE'],
      to: params[:user][:phone],
      body: params[:message]
    )
  end
end
