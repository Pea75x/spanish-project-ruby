json.sentences do
  json.array! word.sentences do |sentence|
    json.partial! "sentences/sentence_short", sentence: sentence
  end
end

if word.verb.nil?
  json.verb nil
else
  json.verb do
    json.extract! word.verb, :word, :translation
  end
end

json.extract! word, :id, :word, :translation, :themes