json.set! :total, @total_words
json.set! :data, @words, partial: 'words/word_short', as: :word