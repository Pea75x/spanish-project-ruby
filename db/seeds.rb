# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tener = Word.create(word: "tener", translation: "To have", type_verb: true)
tengo = Word.create(word: "tengo", translation: "I have", verb: tener)
tenemos = Word.create(word: "tenemos", translation: "We have", verb: tener)
sentence = Sentence.create(sentence: "Tengo hambre", translation: "I am hungry", word_ids: [tengo.id])

pp "created words and sentences!"