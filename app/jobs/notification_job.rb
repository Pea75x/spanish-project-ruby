require 'sidekiq'

class NotificationJob
  include Sidekiq::Job

  sidekiq_options retry: 5

  def perform
    Game.includes(game_scores: :user).each do |game|
      top_scorer = game.game_scores.sort_by(&:game_points).last&.user

      if top_scorer.present?
        NotificationMailer.with(user: top_scorer, game: game).top_score_notifier.deliver_now
      else
        Rails.logger.info "No top scorer found for game: #{game.id}"
      end
    end
  end
end
