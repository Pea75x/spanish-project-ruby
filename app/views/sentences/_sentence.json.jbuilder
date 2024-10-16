json.extract! sentence, :id, :sentence, :translation, :themes

json.words do
  json.array! sentence.words do |word|
    json.partial! "words/word_short", word: word
  end
end