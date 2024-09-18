class AddOrderToSentenceWords < ActiveRecord::Migration[6.1]
  def change
    add_column :sentences_words, :order, :integer
  end
end