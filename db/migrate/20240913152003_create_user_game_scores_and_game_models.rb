class CreateUserGameScoresAndGameModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.boolean :admin
      t.timestamps
    end

    create_table :games do |t|
      t.string :name
      t.string :themes, default: [], array: true
      t.timestamps
    end

    create_table :game_scores do |t|
      t.integer :game_points
      t.integer :user_id
      t.integer :game_id
      t.timestamps
    end

    add_index :game_scores, :user_id
    add_index :game_scores, :game_id
    add_foreign_key :game_scores, :users, column: :user_id
    add_foreign_key :game_scores, :games, column: :game_id
  end
end
