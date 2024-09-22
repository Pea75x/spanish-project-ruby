# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tener = Word.create(word: "tener", translation: "To have", type_verb: true)
hacer = Word.create(word: "hacer", translation: "To make", type_verb: true)
esquiar = Word.create(word: "esquiar", translation: "To ski", type_verb: true, themes: ["activities"])

tengo = Word.create(word: "tengo", translation: "I have", verb: tener)
tenemos = Word.create(word: "tenemos", translation: "We have", verb: tener)
hiciste = Word.create(word: "hiciste", translation: "You made", verb: hacer)
esquiaba = Word.create(word: "esquiaba", translation: "Skied", verb: esquiar, themes: ["activities"])

hambre = Word.create(word: "hambre", translation: "hunger", themes: ["food"])
que = Word.create(word: "que", translation: "what")
a_menudo = Word.create(word: "a menudo", translation: "often")
cuando = Word.create(word: "cuando", translation: "when")
era = Word.create(word: "era", translation: "was", themes: ["pretérito_imperfecto"])
nina = Word.create(word: "niña", translation: "little girl")


sentence1 = Sentence.create(sentence: "Tengo hambre", translation: "I am hungry", themes: ["food", "presente"])
sentence2 = Sentence.create(sentence: "Que Hiciste", translation: "What did you do", themes: ["pretérito_indefinido", "activities"])
sentence3 = Sentence.create(sentence: "Esquiaba a menudo cuando era niña", translation: "I skied often when I was a child", themes: ["pretérito_imperfecto", "activities"])

def add_relationship(sentence, words)
  words.each_with_index do |word_id, index|
    SentencesWord.create(sentence_id: sentence.id, word_id: word_id, order: index + 1)
    pp sentence.words[index]
  end
end

add_relationship(sentence1, [tengo.id, hambre.id])
add_relationship(sentence2, [que.id, hiciste.id])
add_relationship(sentence3, [esquiaba.id, a_menudo.id, cuando.id, era.id, nina.id])

admin_user = User.create(username: "admin1", email: "admin@email.com", password: "qweqweqwe", admin: true)
agent_user = User.create(username: "user1", email: "user@email.com", password: "qweqweqwe")

game1 = Game.create(name: "Pretérito Indefinido vs Pretérito Imperfecto", themes: ["pretérito_indefinido", "pretérito_imperfecto"])
game2 = Game.create(name: "Presente, Pasado/Pretérito o Futuro", themes: ["pretérito_indefinido", "pretérito_imperfecto"])

game_score1 = GameScore.create(user: agent_user, game: game1, game_points: 78)
game_score2 = GameScore.create(user: admin_user, game: game1, game_points: 93)

pp "created words and sentences!"