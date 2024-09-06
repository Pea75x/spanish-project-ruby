json.words do
  json.array! sentence.words do |word|
    json.extract! word, :id, :word, :translation
  end
end

json.extract! sentence, :id, :sentence, :translation, :themes