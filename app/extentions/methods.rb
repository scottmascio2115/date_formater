


WEEKDAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Please retry this slot. You did not input a proper day."]


def proper_day(day)

  if day == "" || day == "Monday" || day == "Tuesday" || day == "Wednesday" || day == "Thursday" || day == "Friday" || day == "Saturday" || day == "Sunday"
    day
  else
    "Please retry this slot. You did not input a proper day."
  end
end


def format_time(time)
  no_white_spaces = time.gsub(/\s+/, "")
end


def day_time(day, time)
  if day.nil? || time.empty?
    ''
  else
    "#{proper_day(day)}: #{format_time(time)}"
  end
end

def sorted(days, constants)
  days.sort_by do |element|
    constants.index(element)
  end
end

