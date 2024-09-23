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
trabajar = Word.create(word: "trabajar", translation: "To work", type_verb: true, themes: ["work"])
haber = Word.create(word: "haber", translation: "To have", type_verb: true)

yo = Word.create(word: "yo", translation: "I", verb: tener, themes: ["me"])
tu = Word.create(word: "tú", translation: "You", verb: tener, themes: ["you"])
el = Word.create(word: "él/ella", translation: "He/she", verb: tener, themes: ["he/she"])
nosotros = Word.create(word: "nosotros/as", translation: "we", verb: tener, themes: ["we"])
ellos = Word.create(word: "ellos/ellas", translation: "They", verb: tener, themes: ["they"])

tengo = Word.create(word: "tengo", translation: "I have", verb: tener, themes: ["me", "presente"])
tienes = Word.create(word: "tienes", translation: "You have", verb: tener, themes: ["you", "presente"])
tiene = Word.create(word: "tiene", translation: "He/she has", verb: tener, themes: ["he/she", "presente"])
tenemos = Word.create(word: "tenemos", translation: "We have", verb: tener, themes: ["we", "presente"])
tienen = Word.create(word: "tienen", translation: "They have", verb: tener, themes: ["they", "presente"])

tuve = Word.create(word: "tuve", translation: "I had", verb: tener, themes: ["me", "preterito_indefinido"])
tuviste = Word.create(word: "tuviste", translation: "You had", verb: tener, themes: ["you", "preterito_indefinido"])
tuvo = Word.create(word: "tuvo", translation: "He/she had", verb: tener, themes: ["he/she", "preterito_indefinido"])
tuvimos = Word.create(word: "tuvimos", translation: "We had", verb: tener, themes: ["we", "preterito_indefinido"])
tuvieron = Word.create(word: "tuvieron", translation: "They had", verb: tener, themes: ["they", "preterito_indefinido"])

tenía = Word.create(word: "tenía", translation: "I had", verb: tener, themes: ["me", "preterito_imperfecto", "indicativo"])
tenías = Word.create(word: "tenías", translation: "You had", verb: tener, themes: ["you", "preterito_imperfecto", "indicativo"])
tenía = Word.create(word: "tenía", translation: "He/she had", verb: tener, themes: ["He/she", "preterito_imperfecto", "indicativo"])
teníamos = Word.create(word: "teníamos", translation: "We had", verb: tener, themes: ["we", "preterito_imperfecto", "indicativo"])
tenían = Word.create(word: "tenían", translation: "They had", verb: tener, themes: ["they", "preterito_imperfecto", "indicativo"])

tuviera = Word.create(word: "tuviera", translation: "I/he/she had", verb: tener, themes: ["me", "preterito_imperfecto", "subjuntivo"])
tuvieras = Word.create(word: "tuvieras", translation: "You had", verb: tener, themes: ["you", "preterito_imperfecto", "subjuntivo"])
tuviéramos = Word.create(word: "tuviéramos", translation: "We had", verb: tener, themes: ["we", "preterito_imperfecto", "subjuntivo"])
tuvieran = Word.create(word: "tuvieran", translation: "They had", verb: tener, themes: ["they", "preterito_imperfecto", "subjuntivo"])

tenido = Word.create(word: "tenido", translation: "had", verb: tener, themes: ["preterito_perfecto_compuesto"])
he = Word.create(word: "he", translation: "I have", verb: haber, themes: ["me", "preterito_perfecto_compuesto"])
has = Word.create(word: "has", translation: "You have", verb: haber, themes: ["you", "preterito_perfecto_compuesto"])
ha = Word.create(word: "ha", translation: "He/she had", verb: haber, themes: ["He/she", "preterito_perfecto_compuesto"])
hemos = Word.create(word: "hemos", translation: "we have", verb: haber, themes: ["we", "preterito_perfecto_compuesto"])
han = Word.create(word: "han", translation: "they have", verb: haber, themes: ["they", "preterito_perfecto_compuesto"])

tendre = Word.create(word: "tendré", translation: "I will have", verb: tener, themes: ["me", "futuro_simple"])
tendras = Word.create(word: "tendrás", translation: "You will have", verb: tener, themes: ["you", "futuro_simple"])
tendra = Word.create(word: "tendrá", translation: "He/she will have", verb: tener, themes: ["he/she", "futuro_simple"])
tendremos = Word.create(word: "tendremos", translation: "We will have", verb: tener, themes: ["we", "futuro_simple"])
tendrán = Word.create(word: "tendrán", translation: "They will have", verb: tener, themes: ["they", "futuro_simple"])

hiciste = Word.create(word: "hiciste", translation: "You made", verb: hacer, themes: ["you", "preterito_indefinido"])
esquiaba = Word.create(word: "esquiaba", translation: "Skied", verb: esquiar, themes: ["activities", "preterito_imperfecto", "me", "he/she"])
tuviera = Word.create(word: "tuviera", translation: "I had", verb: tener, themes: ["me", "preterito_imperfecto", "subjuntivo"])
trabajo = Word.create(word: "trabajo", translation: "work/I work", verb: trabajar, themes: ["work"])

hambre = Word.create(word: "hambre", translation: "hunger", themes: ["food"])
que = Word.create(word: "que", translation: "what")
a_menudo = Word.create(word: "a menudo", translation: "often")
cuando = Word.create(word: "cuando", translation: "when")
era = Word.create(word: "era", translation: "was", themes: ["preterito_imperfecto"])
nina = Word.create(word: "niña", translation: "little girl")
ojala = Word.create(word: "ojalá", translation: "I wish", themes: ["me"])
no = Word.create(word: "no", translation: "no")
tanto = Word.create(word: "tanto", translation: "so much")

sentence1 = Sentence.create(sentence: "Tengo hambre", translation: "I am hungry", themes: ["food", "presente"])
sentence2 = Sentence.create(sentence: "Que Hiciste", translation: "What did you do", themes: ["preterito_indefinido", "activities"])
sentence3 = Sentence.create(sentence: "Esquiaba a menudo cuando era niña", translation: "I skied often when I was a child", themes: ["preterito_imperfecto", "activities"])

def add_relationship(sentence, words)
  words.each_with_index do |word_id, index|
    SentencesWord.create(sentence_id: sentence.id, word_id: word_id, order: index + 1)
  end
end

add_relationship(sentence1, [tengo.id, hambre.id])
add_relationship(sentence2, [que.id, hiciste.id])
add_relationship(sentence3, [esquiaba.id, a_menudo.id, cuando.id, era.id, nina.id])

admin_user = User.create(username: "admin1", email: "admin@email.com", password: "qweqweqwe", admin: true)
agent_user = User.create(username: "user1", email: "user@email.com", password: "qweqweqwe")

game1 = Game.create(name: "past", themes: [
  "preterito_indefinido",
  "preterito_imperfecto",
  "preterito_perfecto_compuesto",
  "preterito_pluscuamperfecto"
  ])
game2 = Game.create(name: "future", themes: [
  "futuro_simple",
  "futuro_compuesto",
  "condicional_simple"
])

game3 = Game.create(name: "weather", themes: ["weather"])
game4 = Game.create(name: "hypothetical", themes: ["indicativo", "subjuntivo"])

game_score1 = GameScore.create(user: agent_user, game: game1, game_points: 78)
game_score2 = GameScore.create(user: admin_user, game: game1, game_points: 93)

pp "created words and sentences!"