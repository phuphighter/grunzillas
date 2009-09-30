class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.integer :game_id
      t.integer :lineup_order
      t.string :last_name
      t.string :first_name
      t.integer :game
      t.integer :at_bats
      t.integer :hits
      t.integer :singles
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :walks
      t.integer :runs
      t.integer :rbi
      t.decimal :batting_average
      t.decimal :on_base_percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end
