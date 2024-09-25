if verb_tense.participle_id.nil?
  json.participle nil
else
  json.participle do
    json.extract! verb_tense.participle, :id, :word, :translation
  end
end


json.verb do
  json.extract! verb_tense.verb, :id, :word, :translation
end

json.yo do
  json.extract! verb_tense.yo, :id, :word, :translation
end

json.tu do
  json.extract! verb_tense.tu, :id, :word, :translation
end

json.el do
  json.extract! verb_tense.el, :id, :word, :translation
end

json.nosotros do
  json.extract! verb_tense.nosotros, :id, :word, :translation
end

json.ellos do
  json.extract! verb_tense.ellos, :id, :word, :translation
end

json.extract! verb_tense, :id, :name, :themes, :sentences
