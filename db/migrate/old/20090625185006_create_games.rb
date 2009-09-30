class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :season
      t.string :season_description
      t.integer :game_number
      t.date :date
      t.integer :score
      t.integer :opponent_score
      t.integer :win
      t.integer :loss

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
