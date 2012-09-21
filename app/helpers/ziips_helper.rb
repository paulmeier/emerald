module ZiipsHelper
  def ziip_chart_series(ziips, start_time)
    ziips_by_day = ziips.where(:DateTime => start_time.beginning_of_day..Time.zone.now.end_of_day).
                  group("date(DateTime)").
                  select("DateTime, AVG(PCTBOX) as ziip_average")
    (start_time.to_date..Date.yesterday).map do |date|
      ziip = ziips_by_day.detect { |ziip| ziip.DateTime.to_date == date}
      ziip && ziip.ziip_average.to_f || 0
    end.inspect
  end
  
  def custom_ziip_chart(ziips, from, to)
    ziips_by_day = ziips.between(from,to).group("date(DateTime)").select("DateTime, AVG(PCTBOX) as ziip_average")
    (from.to_date..to.to_date).map do |date|
      ziip = ziips_by_day.detect { |ziip| ziip.DateTime.to_date == date}
      ziip && ziip.ziip_average.to_f || 0
    end.inspect
  end

end
