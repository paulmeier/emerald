#This class is here to extend the Rails built in Date class to account for previous business day and next business day
require 'holidays'
require 'holidays/us'

# Add countries up here you wish to account holidays.
#~ require 'holidays/de'

class Date
  def next_business_day(region=:any)
    next_business_days(1,region)
  end    

  def next_business_days(inc, region=:any)
    d = [6,0]
    date = self
    inc.times{
      date = date.next
      while (d.include?(date.wday) or date.holiday?(region)) do
        date = date.next
      end
    }
    date
  end    

  def previous_business_day(region=:any)
    previous_business_days(1,region)
  end

  def previous_business_days(inc, region=:any)
    d = [6,0]
    date = self
    inc.times{
      date = date.prev_day
      while (d.include?(date.wday) or date.holiday?(region)) do
        date = date.prev_day
      end
    }
    date
  end
end    