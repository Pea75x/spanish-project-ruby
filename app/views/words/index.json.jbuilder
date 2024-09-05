json.set! :total, @total_words
json.set! :data, @words, partial: 'words/word', as: :word