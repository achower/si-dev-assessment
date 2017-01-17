class PagesController < ApplicationController
  def home
  end

  def sms
    #byebug
    #raise "Action sms in the UsersController is not implemented! received params #{params.to_json}"
    require 'twilio-ruby'

    account_sid = ENV['TWILIO_ACCOUNT_SID'] #account_sid = 'ACee44210f6d2954b784af10e5ddbdc164' # Your Account SID from www.twilio.com/user/account
    auth_token = ENV['TWILIO_AUTH_TOKEN'] #auth_token = '3748de84cdb04fa784ac7163eff31e23'   # Your Auth Token from www.twilio.com/user/account

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.account.messages.create(
      from: ENV['FROM_PHONE'],
      to: params[:user][:phone],
      body: params[:message]
    )
  end
end
