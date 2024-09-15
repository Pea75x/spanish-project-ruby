json.set! :total, @total_games
json.set! :data, @games, partial: 'games/game', as: :game
