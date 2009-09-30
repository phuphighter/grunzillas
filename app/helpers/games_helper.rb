module GamesHelper

  def fields_for_statistic(statistic, &block)
    prefix = statistic.new_record? ? 'new' : 'existing'
    fields_for("game[#{prefix}_statistic_attributes][]", statistic, &block)
  end

  def add_statistic_link(name) 
    link_to_function name do |page| 
      page.insert_html :bottom, :statistics, :partial => 'statistic', :object => Statistic.new 
    end 
  end 

end
