class Comment <ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :comment, presence: :true
  before_create :send_sms

  private
  def send_sms
    begin
      response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => comment,
        :To => post.user.telephone,
        :From => '5039256735' }
        ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
