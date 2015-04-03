class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  before_save :send_sms

private

  def send_sms
    self.post.user






#
# def send_message
#   response = RestClient::Request.new(
#     :method => :post,
#     :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
#     :user => ENV['TWILIO_ACCOUNT_SID'],
#     :password => ENV['TWILIO_AUTH_TOKEN'],
#     :payload => { :Body => body,
#                   :To => Contact.find(self.contact_id).number,
#                   :From => ENV['USER_NUMBER'] }
#   ).execute
# end

  end
end
