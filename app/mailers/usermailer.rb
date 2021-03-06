class Usermailer < ActionMailer::Base
  default from: "notifications@codespork.com"
  def welcome_email(user)
    @user = user
    @url = "http://codespork.com/users/sign_in"
    mail(to: @user.email, subject: 'Welcome to the codeSpork family!')
  end

  def reply_notification(poster, commenter, url)
    @poster = poster
    @commenter = commenter
    @url = url
    mail(to: @poster.email, subject: "#{@commenter.user_name} just commented on your post!")
  end

  def post_notification(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: "Thank you for posting!")
  end

  def qa_notification(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: "A new question was asked in the Q&A section.")
  end

  def contact_notification(user)
    @user = user
    @url = @user.email
    mail(to: 'http://codespork.com', subject: 'New Contact Form Post')
  end
end
