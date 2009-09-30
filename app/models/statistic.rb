class Statistic < ActiveRecord::Base
  belongs_to :game

  validates_presence_of :plate_apps, :lineup_order, :last_name, :first_name
  validates_numericality_of :plate_apps, :greater_than => 0
  validate :stat_logic_validations

  def stat_logic_validations
    # validates plate_apps
    if plate_apps < singles+doubles+triples+home_runs+walks+fielders_choice+sac_fly
      self.errors.add(:plate_apps, ' must be greater.')
    # validates plate_apps > hits
    elsif plate_apps < singles+doubles+triples+home_runs
      self.errors.add('There are more hits than plate apps.')
    # validates hits < at_bats
    elsif singles+doubles+triples+home_runs > plate_apps-(walks+sac_fly)
      self.errors.add('There are more hits than at bats.')
    end
  end

  def self.select_total_stats
    "last_name, first_name,
      count(last_name) as 'games_played',
      sum(plate_apps) as 'plate_apps',
      sum(at_bats) as 'at_bats',
      sum(hits) as 'hits',
      sum(singles) as 'singles',
      sum(doubles) as 'doubles',
      sum(triples) as 'triples',
      sum(home_runs) as 'home_runs',
      sum(walks) as 'walks',
      sum(fielders_choice) as 'fielders_choice',
      sum(sac_fly) as 'sac_fly',
      sum(runs) as 'runs',
      sum(rbi) as 'rbi',
      (sum(hits)/sum(at_bats)) as 'batting_average',
      ((sum(hits)+sum(walks)+sum(fielders_choice))/sum(plate_apps)) as 'on_base'"
  end

  def self.total_stats
    find(:all, :group => "last_name", :select => select_total_stats, :group => "last_name")
  end

  def self.will_sort(sort_by)
    case sort_by
      when "last_name"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "last_name, id")
      when "last_name_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "last_name DESC, id")
      when "first_name"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "first_name, id")
      when "first_name_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "first_name DESC, id")
      when "games_played"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "games_played DESC, id")
      when "games_played_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "games_played, id")
      when "plate_apps"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "plate_apps DESC, id")
      when "plate_apps_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "plate_apps, id")
      when "at_bats"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "at_bats DESC, id")
      when "at_bats_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "at_bats, id")
      when "hits"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "hits DESC, id")
      when "hits_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "hits, id")
      when "singles"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "singles DESC, id")
      when "singles_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "singles, id")
      when "doubles"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "doubles DESC, id")
      when "doubles_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "doubles, id")
      when "triples"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "triples DESC, id")
      when "triples_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "triples, id")
      when "home_runs"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "home_runs DESC, id")
      when "home_runs_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "home_runs, id")
      when "walks"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "walks DESC, id")
      when "walks_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "walks, id")
      when "fielders_choice"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "fielders_choice DESC, id")
      when "fielders_choice_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "fielders_choice, id")
      when "sac_fly"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "sac_fly DESC, id")
      when "sac_fly_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "sac_fly, id")
      when "runs"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "runs DESC, id")
      when "runs_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "runs, id")
      when "rbi"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "rbi DESC, id")
      when "rbi_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "rbi, id")
      when "batting_average"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "batting_average DESC, id")
      when "batting_average_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "batting_average, id")
      when "on_base"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "on_base DESC, id")
      when "on_base_reverse"
        find(:all, :group => "last_name", :select => select_total_stats, :order => "on_base, id")
      else
        find(:all, :group => "last_name", :select => select_total_stats, :group => "last_name")
    end
  end 

end
