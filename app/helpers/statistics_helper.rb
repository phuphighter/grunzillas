module StatisticsHelper

  def will_sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort_by] == param
    options = games_path(:sort_by=> key)
    link_to(text, options)
  end

  def stat_will_sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort_by] == param
    options = statistics_games_path(:sort_by=> key)
    link_to(text, options)
  end

end
