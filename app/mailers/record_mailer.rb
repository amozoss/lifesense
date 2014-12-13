class RecordMailer < ActionMailer::Base
#  default from: "data@lifesense.com"
  default :from => 'no-reply@lifesense.herokuapp.com'

  def send_record(user, record, sensor)
    @user = user
    @record = record
    @sensor = sensor

    mail(to: @user.email, subject: 'LifeSense Data Record')
  end

  def hello_world(user)
    @user = user

    mail(to: @user.email, subject: 'LifeSense Data Record')
  end
end
