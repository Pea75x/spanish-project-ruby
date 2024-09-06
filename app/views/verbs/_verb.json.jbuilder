json.words do
  json.array! verb.words do |word|
    json.extract! word, :id, :word, :translation
  end
end

json.extract! verb, :id, :verb, :translation