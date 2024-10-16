json.extract! user, :id, :username, :total_score

json.game_scores do
  json.array! user.game_scores do |score|
    json.name score.game_name
    json.points score.game_points
    json.leaderboard_ranking score.leaderboard_ranking
  end
end
