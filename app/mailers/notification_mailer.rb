class NotificationMailer < ApplicationMailer
  default from: "spanish-project@email.com"

  def top_score_notifier

    mail(to: "priya_93_x@hotmail.co.uk", subject: "Spanish Project - You are this weeks high Scorer")
  end
end