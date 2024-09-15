json.game_scores do
  json.array! user.game_scores do |score|
    json.name score.game_name
    json.points score.game_points
  end
end

json.extract! user, :id, :username, :total_score
