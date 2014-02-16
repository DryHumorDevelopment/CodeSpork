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
end
