require 'sidekiq'

class NotificationJob
  include Sidekiq::Job

  def perform()
    Games.all.each do |game|
      top_scorer = game.game_scores.order(game_points: "desc").first&.user

      NotificationMailer.with(user: top_scorer, game: game).top_score_notifier.deliver_later if top_scorer
    end
  end
end
