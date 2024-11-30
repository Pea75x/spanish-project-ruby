require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline!

describe NotificationJob do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user, username: "user2", email: "user2@email.com") }
  let!(:user3) { create(:user, username: "user3", email: "user3@email.com") }

  let!(:game1) { Game.create(name: "game1") }
  let!(:game2) { Game.create(name: "game2") }

  let!(:game_score1) { GameScore.create(user: user1, game: game1, game_points: 98) }
  let!(:game_score2) { GameScore.create(user: user1, game: game2, game_points: 64) }
  let!(:game_score3) { GameScore.create(user: user2, game: game1, game_points: 78) }
  let!(:game_score4) { GameScore.create(user: user3, game: game1, game_points: 51) }
  let!(:game_score5) { GameScore.create(user: user3, game: game2, game_points: 83) }

  # Who should receive emails -
  # user1 - game1 
  # user2 - none
  # user3 - game2

  context "#perform" do
    before do
      ActionMailer::Base.deliveries.clear
      NotificationJob.new.perform
    end

    it "sends 2 emails" do
      expect(ActionMailer::Base.deliveries.count).to eq(2)
    end

    it "sends correct information to the correct users" do
      emails = ActionMailer::Base.deliveries

      expect(emails.first.to).to eq([user1.email])
      expect(emails.first.body).to include(game1.name) 

      expect(emails.last.to).to eq([user3.email])
      expect(emails.last.body).to include(game2.name) 
    end
  end
end