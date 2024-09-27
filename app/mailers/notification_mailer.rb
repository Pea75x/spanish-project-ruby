class NotificationMailer < ApplicationMailer
  default from: "spanish-project@email.com"

  def top_score_notifier
    @user = params[:user]
    @game = params[:game]

    if @user.nil?
      Rails.logger.warn "Attempted to send email without a user!"
      return
    end

    Rails.logger.info "Sending email to: #{@user&.username}, Game: #{@game&.name}"

    mail(to: "priya_93_x@hotmail.co.uk", subject: "Spanish Project - You are this weeks high Scorer")
  end
end