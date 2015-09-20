module Utilities
	
	SECONDS_IN_YEAR = 60*60*24*365.0
	
	def leap_year?(year)
		(year % 100 == 0 && year % 400 == 0) || (year % 4 == 0 && !(year % 100 == 0))
	end

	def percent_of_year(percent)
		('%.1f' % (percent*10000 / SECONDS_IN_YEAR)) + '%'
	end

	def convertMilitaryTime(time)
		hourS, b = time.split(":")
		hourI = hourS.to_i
		minutes, dayOrNight = b.split(" ")
		response = ""

		if dayOrNight.downcase == 'pm' && hourI == 12
			response = hourS + ":" + minutes
		elsif dayOrNight.downcase == 'am' && hourI == 12
			response = (hourI - 12).to_s + ":" + minutes
		elsif dayOrNight.downcase == 'pm' && hourI != 12
			response = (hourI + 12).to_s + ":" + minutes
		elsif dayOrNight.downcase == 'am' && hourI != 12
			response = hourS + ":" + minutes
		end
	end

	def convertStandardTime(time)
		hour, minutes = time.split(":")

		if hour.to_i == 0
			'12:' + minutes + ' am'
		elsif hour.to_i < 12
			hour + ':' + minutes + " am"
		else
			(hour.to_i - 12).to_s + ':' + minutes + " pm"
		end
	end

	def bedtime?(time, bool)
		hours = time.split(":")[0].to_i
		am_or_pm = time.split(":")[1].split(" ")[1]

		(hours >= 8 && bool || hours >= 10 && !bool) && am_or_pm == 'PM' ? false : true
	end

	def span(a, b)
		c = 0
		d = 0
		if a < b
			c = b
			d = a
		else
			c = a
			d = b
		end

		return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
	end
	
	def difference_in_percentages(num_secs1, num_secs2)
		year_percent1 = percent_of_year(num_secs1)[0..-2].to_f
		year_percent2 = percent_of_year(num_secs2)[0..-2].to_f
		num_secs1 < num_secs2 ? total_percent(year_percent2,year_percent1) : total_percent(year_percent1, year_percent2)
	end
	
	def is_divisible_by?(int, dividend)
		int % dividend == 0
	end
	
	def total_percent(percent1, percent2)
		('%.1f' % (percent1 - percent2)).to_s + '%'
	end

	def percent_of_year(a)
		year_percent(a).to_f
	end

	def year_percent(a)
			(a / SECONDS_IN_YEAR) * 100
	end

end
