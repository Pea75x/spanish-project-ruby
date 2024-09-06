json.sentences do
  json.array! word.sentences do |sentence|
    json.extract! sentence, :id, :sentence, :translation
  end
end

if word.verb.nil?
  json.verb nil
else
  json.verb do
    json.extract! word, :id, :word, :translation
  end
end

json.extract! word, :id, :word, :translation, :themes