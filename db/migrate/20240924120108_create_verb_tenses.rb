class CreateVerbTenses < ActiveRecord::Migration[7.0]
  def change
    create_table :verb_tenses do |t|
      t.string :name
      t.integer :verb_id
      t.integer :yo_id
      t.integer :tu_id
      t.integer :el_id
      t.integer :nosotros_id
      t.integer :ellos_id
      t.integer :participle_id
      t.string :themes, array: true, default: []
      t.timestamps
    end
  end
end
