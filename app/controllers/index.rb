require 'date'
require_relative '../extentions/methods.rb'


get '/' do
  # Look in app/views/index.erb
  @time = Time.now
  erb :index
end

get '/formatted' do
  @storename = params[:store].upcase
  @font = params[:font]

  @unsorteddays = []

  @day1 = params[:day1].capitalize.strip
  if @day1.length > 1
    @unsorteddays << proper_day(@day1)
  end
  @time1 = params[:time1]
  @day2 = params[:day2].capitalize.strip
  if @day2.length > 1
    @unsorteddays << proper_day(@day2)
  end
  @time2 = params[:time2]
  @day3 = params[:day3].capitalize.strip
  if @day3.length > 1
    @unsorteddays << proper_day(@day3)
  end
  @time3 = params[:time3]
  @day4 = params[:day4].capitalize.strip
  if @day4.length > 1
    @unsorteddays << proper_day(@day4)
  end
  @time4 = params[:time4]
  @day5 = params[:day5].capitalize.strip
  if @day5.length > 1
    @unsorteddays << proper_day(@day5)
  end
  @time5 = params[:time5]
  @day6 = params[:day6].capitalize.strip
  if @day6.length > 1
    @unsorteddays << proper_day(@day6)
  end
  @time6 = params[:time6]
  @day7 = params[:day7].capitalize.strip
  if @day7.length > 1
    @unsorteddays << proper_day(@day7)
  end
  @time7 = params[:time7]

  @weekdays = sorted(@unsorteddays, WEEKDAYS)

  @one =  day_time(@weekdays[0], @time1)
  @two =  day_time(@weekdays[1], @time2)
  @three =  day_time(@weekdays[2], @time3)
  @four =  day_time(@weekdays[3], @time4)
  @five =  day_time(@weekdays[4], @time5)
  @six =  day_time(@weekdays[5], @time6)
  @seven =  day_time(@weekdays[6], @time7)

  @days = [@one, @two, @three, @four, @five, @six, @seven]

  @time = Time.now
  erb :formatted
end

