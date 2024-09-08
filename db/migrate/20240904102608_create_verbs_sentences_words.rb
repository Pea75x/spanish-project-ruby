class CreateVerbsSentencesWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :translation
      t.boolean :type_verb, default: false
      t.string :themes, array: true, default: []
      t.timestamps
    end

    create_table :sentences do |t|
      t.string :sentence
      t.string :translation
      t.string :themes, array: true, default: []
      t.timestamps
    end

    create_join_table :words, :sentences
  end
end
