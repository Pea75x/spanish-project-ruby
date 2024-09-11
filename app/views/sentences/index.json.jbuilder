json.set! :total, @total_sentences
json.set! :data, @sentences, partial: 'sentences/sentence', as: :sentence