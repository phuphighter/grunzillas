class Game < ActiveRecord::Base
  has_many :statistics, :dependent => :destroy
  validates_associated :statistics

  after_update :save_statistics

  def new_statistic_attributes=(statistic_attributes)
    statistic_attributes.each do |attributes|
      statistics.build(attributes)
    end
  end
  
  def existing_statistic_attributes=(statistic_attributes)
    statistics.reject(&:new_record?).each do |statistic|
      attributes = statistic_attributes[statistic.id.to_s]
      if attributes
        statistic.attributes = attributes
      else
        statistics.delete(statistic)
      end
    end
  end
  
  def save_statistics
    statistics.each do |statistic|
      statistic.save(false)
    end
  end

  def self.update_stats
    stats = Statistic.all
    
    stats.each do |stat|
      stat.update_attribute(:at_bats, stat.plate_apps-(stat.walks+stat.sac_fly)) 
      stat.update_attribute(:hits, stat.singles+stat.doubles+stat.triples+stat.home_runs)     
      on_base = (stat.hits.to_f+stat.walks.to_f+stat.fielders_choice.to_f)/(stat.plate_apps.to_f)
      stat.update_attribute(:batting_average, stat.hits.to_f/stat.at_bats.to_f)
      stat.update_attribute(:on_base_percentage, on_base)
    end
  end

  def self.update_stats_update(id)
    stat = Statistic.find(id)
      stat.update_attribute(:at_bats, stat.plate_apps-(stat.walks+stat.sac_fly)) 
      stat.update_attribute(:hits, stat.singles+stat.doubles+stat.triples+stat.home_runs)
      on_base = (stat.hits.to_f+stat.walks.to_f+stat.fielders_choice.to_f)/(stat.plate_apps.to_f)
      stat.update_attribute(:batting_average, stat.hits.to_f/stat.at_bats.to_f)
      stat.update_attribute(:on_base_percentage, on_base)
  end

  def self.update_record
    games = Game.all
    games.each do |game|
      game.update_attribute(:win, 1) if game.score > game.opponent_score
      game.update_attribute(:loss, 1) if game.opponent_score > game.score
    end
  end

end
