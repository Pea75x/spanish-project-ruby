json.set! :total, @total_sentences
json.set! :data, @sentences, partial: 'sentences/sentence_short', as: :sentence