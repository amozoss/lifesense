class RecordMailer < ActionMailer::Base
  default from: "data@lifesense.com"

  def send_record(user, record)
#    @user = user
#    @record = record
    @user = 'hi'
    @record = 'record'

#    mail(to: @user.email, subject: 'LifeSense Data Record')
  end

  def hello_world(user)
    @user = user
    mail(to: @user.email, subject: 'LifeSense Data Record')
  end
end
