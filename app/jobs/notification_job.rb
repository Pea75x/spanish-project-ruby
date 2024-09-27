require 'sidekiq'

class NotificationJob
  include Sidekiq::Job

  def perform()
    Game.all.each do |game|
      top_scorer = game.game_scores.order(game_points: "desc").first&.user
      pp top_scorer

      if top_scorer.present?
        NotificationMailer.with(user: top_scorer, game: game).top_score_notifier.deliver_now
      else
        Rails.logger.info "No top scorer found for game: #{game.id}"
      end
    end
  end
end
