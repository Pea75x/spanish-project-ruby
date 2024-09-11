# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tener = Word.create(word: "tener", translation: "To have", type_verb: true)
hacer = Word.create(word: "hacer", translation: "To make", type_verb: true)
esquiar = Word.create(word: "esquiar", translation: "To ski", type_verb: true)

tengo = Word.create(word: "tengo", translation: "I have", verb: tener)
tenemos = Word.create(word: "tenemos", translation: "We have", verb: tener)
hiciste = Word.create(word: "hiciste", translation: "You made", verb: hacer)
esquiaba = Word.create(word: "esquiaba", translation: "Skied", verb: esquiar)

hambre = Word.create(word: "hambre", translation: "hunger", themes: ["food"])
que = Word.create(word: "que", translation: "what")
a_menudo = Word.create(word: "a menudo", translation: "often")
cuando = Word.create(word: "cuando", translation: "when")
era = Word.create(word: "era", translation: "was", themes: ["past_tense"])
nina = Word.create(word: "niña", translation: "little girl")


sentence1 = Sentence.create(sentence: "Tengo hambre", translation: "I am hungry", word_ids: [tengo.id, hambre.id])
sentence2 = Sentence.create(sentence: "Que Hiciste", translation: "What did you do", word_ids: [que.id, hiciste.id], themes: ["Pretérito Indefinido", "activities"])
sentence3 = Sentence.create(sentence: "Esquiaba a menudo cuando era niña", translation: "I skied often when I was a child", word_ids: [esquiaba.id, a_menudo.id, cuando.id, era.id, nina.id], themes: ["Pretérito Imperfecto", "activities"])

pp "created words and sentences!"