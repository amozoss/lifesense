class RecordMailer < ActionMailer::Base
#  default from: "data@lifesense.com"
  default :from => 'no-reply@lifesense.herokuapp.com'

  def send_record(user, record)
    @user = user
    @record = record

    mail(to: 'zach.toolson@gmail.com', subject: 'LifeSense Data Record')
#    mail(to: @user.email, subject: 'LifeSense Data Record')
  end

  def hello_world(user)
    @user = user
    mail(to: 'zach.toolson@gmail.com', subject: 'LifeSense Data Record')
#    mail(to: @user.email, subject: 'LifeSense Data Record')
  end
end
