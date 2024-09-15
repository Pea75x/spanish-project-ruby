json.game_scores do
  json.array! @game.game_scores do |score|
    json.user score.user.username
    json.points score.game_points
  end
end

json.extract! @game, :id, :name, :themes

