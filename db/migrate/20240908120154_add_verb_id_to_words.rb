class AddVerbIdToWords < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :verb_id, :integer
    add_index :words, :verb_id
    add_foreign_key :words, :words, column: :verb_id
  end
end
