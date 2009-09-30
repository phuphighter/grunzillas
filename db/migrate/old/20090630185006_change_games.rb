class ChangeGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.integer :win
      t.integer :loss
    end
  end

  def self.down
    drop_table :games
  end
end
