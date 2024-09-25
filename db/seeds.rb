# WORDS
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

tenia = Word.create(word: "tenía", translation: "I had", verb: tener, themes: ["me", "preterito_imperfecto", "he/she", "indicativo"])
tenias = Word.create(word: "tenías", translation: "You had", verb: tener, themes: ["you", "preterito_imperfecto", "indicativo"])
teniamos = Word.create(word: "teníamos", translation: "We had", verb: tener, themes: ["we", "preterito_imperfecto", "indicativo"])
tenian = Word.create(word: "tenían", translation: "They had", verb: tener, themes: ["they", "preterito_imperfecto", "indicativo"])

tuviera = Word.create(word: "tuviera", translation: "I/he/she had", verb: tener, themes: ["me", "preterito_imperfecto", "he/she", "subjuntivo"])
tuvieras = Word.create(word: "tuvieras", translation: "You had", verb: tener, themes: ["you", "preterito_imperfecto", "subjuntivo"])
tuvieramos = Word.create(word: "tuviéramos", translation: "We had", verb: tener, themes: ["we", "preterito_imperfecto", "subjuntivo"])
tuvieran = Word.create(word: "tuvieran", translation: "They had", verb: tener, themes: ["they", "preterito_imperfecto", "subjuntivo"])

tenido = Word.create(word: "tenido", translation: "had", verb: tener, themes: ["preterito_perfecto_compuesto"])
he = Word.create(word: "he", translation: "I have", verb: haber, themes: ["me", "preterito_perfecto_compuesto"])
has = Word.create(word: "has", translation: "You have", verb: haber, themes: ["you", "preterito_perfecto_compuesto"])
ha = Word.create(word: "ha", translation: "He/she had", verb: haber, themes: ["he/she", "preterito_perfecto_compuesto"])
hemos = Word.create(word: "hemos", translation: "we have", verb: haber, themes: ["we", "preterito_perfecto_compuesto"])
han = Word.create(word: "han", translation: "they have", verb: haber, themes: ["they", "preterito_perfecto_compuesto"])

tendre = Word.create(word: "tendré", translation: "I will have", verb: tener, themes: ["me", "futuro_simple"])
tendras = Word.create(word: "tendrás", translation: "You will have", verb: tener, themes: ["you", "futuro_simple"])
tendra = Word.create(word: "tendrá", translation: "He/she will have", verb: tener, themes: ["he/she", "futuro_simple"])
tendremos = Word.create(word: "tendremos", translation: "We will have", verb: tener, themes: ["we", "futuro_simple"])
tendran = Word.create(word: "tendrán", translation: "They will have", verb: tener, themes: ["they", "futuro_simple"])

hiciste = Word.create(word: "hiciste", translation: "You made", verb: hacer, themes: ["you", "preterito_indefinido"])
esquiaba = Word.create(word: "esquiaba", translation: "Skied", verb: esquiar, themes: ["activities", "preterito_imperfecto", "me", "he/she"])
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

# Verb tenses
presente = VerbTense.create(name: "presente", verb: tener, yo: tengo, tu: tienes, el: tiene, nosotros: tenemos, ellos: tienen, themes: ["presente"])
pret_indef = VerbTense.create(name: "Preterito indefinido", verb: tener, yo: tuve, tu: tuviste, el: tuvo, nosotros: tuvimos, ellos: tuvieron, themes:["preterito_indefinido"])
pret_imp_ind = VerbTense.create(name: "Preterito Imperfecto - Indicativo", verb: tener, yo: tenia, tu: tenias, el: tenia, nosotros: teniamos, ellos: tenian, themes:["preterito_imperfecto", "indicativo"])
pret_imp_sub = VerbTense.create(name: "Preterito Imperfecto - Subjuntivo", verb: tener, yo: tuviera, tu: tuvieras, el: tuviera, nosotros: tuvieramos, ellos: tuvieran, themes:["preterito_imperfecto", "subjuntivo"])
pret_perf_com = VerbTense.create(name: "Preterito Perfecto Compuesto", verb: tener, yo: he, tu: has, el: ha, nosotros: hemos, ellos: han, participle: tenido, themes:["preterito_perfecto_compuesto"])
fut_simp = VerbTense.create(name: "Futuro Simple", verb: tener, yo: tendre, tu: tendras, el: tendra, nosotros: tendremos, ellos: tendran, themes:["futuro_simple"])

# Sentences
sentence1 = Sentence.create(sentence: "Tengo hambre", translation: "I am hungry", themes: ["food", "presente"])
sentence2 = Sentence.create(sentence: "Que Hiciste", translation: "What did you do", themes: ["preterito_indefinido", "activities"])
sentence3 = Sentence.create(sentence: "Esquiaba a menudo cuando era niña", translation: "I skied often when I was a child", themes: ["preterito_imperfecto", "activities"])
sentence4 = Sentence.create(sentence: "Ojalá no tuviera tanto trabajo", translation: "I wish I didn't have so much work", themes: ["me", "preterito_imperfecto", "subjuntivo", "work"])

# Word/sentence relationship
def add_relationship(sentence, words)
  words.each_with_index do |word_id, index|
    SentencesWord.create(sentence_id: sentence.id, word_id: word_id, order: index + 1)
  end
end

add_relationship(sentence1, [tengo.id, hambre.id])
add_relationship(sentence2, [que.id, hiciste.id])
add_relationship(sentence3, [esquiaba.id, a_menudo.id, cuando.id, era.id, nina.id])
add_relationship(sentence4, [ojala.id, no.id, tuviera.id, tanto.id, trabajo.id])

# User
admin_user = User.create(username: "admin1", email: "admin@email.com", password: "qweqweqwe", admin: true)
agent_user = User.create(username: "user1", email: "user@email.com", password: "qweqweqwe")

# Game
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

# Game score
game_score1 = GameScore.create(user: agent_user, game: game1, game_points: 78)
game_score2 = GameScore.create(user: admin_user, game: game1, game_points: 93)

pp "created words and sentences!"