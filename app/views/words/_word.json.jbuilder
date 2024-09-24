json.sentences do
  json.array! word.sentences do |sentence|
    json.partial! "sentences/sentence_short", sentence: sentence
  end
end

json.extract! word, :id, :word, :translation, :themes
