class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  before_save :send_sms

private
  def send_sms
    begin
      body = "User #{self.user.name} just commented '#{self.text}' on your post '#{self.post.title}'"
      to_number = self.post.user.phone

      RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :To => to_number,
                    :From => ENV['USER_NUMBER']
                  }
      ).execute
    rescue
      false
    end
  end
end
