require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	# Tests go here
	
	def test_leap_year?
		assert_equal true, @m.leap_year?(2004)
		assert_equal true, @m.leap_year?(1996)
		assert_equal true, @m.leap_year?(400)
		assert_equal false, @m.leap_year?(1900)
		assert_equal false, @m.leap_year?(1607)
		assert_equal false, @m.leap_year?(3)
	end

	def test_percent_of_year
		assert_equal '100.0%', @m.percent_of_year(315360)
		assert_equal '4.76%', @m.percent_of_year(15000)
		assert_equal '63.4%', @m.percent_of_year(200000)
	end

	def test_convertMilitaryTime
		assert_equal '11:53', @m.convertMilitaryTime('11:53 am')
		assert_equal '0:31', @m.convertMilitaryTime('12:31 AM')
		assert_equal '18:22', @m.convertMilitaryTime('6:22 PM')
		assert_equal '23:59', @m.convertMilitaryTime('11:59 pm')
	end

	def test_convertStandardTime
		assert_equal '11:53 am', @m.convertStandardTime('11:53')
		assert_equal '12:31 am', @m.convertStandardTime('0:31')
		assert_equal '6:22 pm', @m.convertStandardTime('18:22')
		assert_equal '11:59 pm', @m.convertStandardTime('23:59')
	end
	
	def test_bedtime 
		assert_equal true, @m.bedtime?('10:29 PM', false)
		assert_equal false, @m.bedtime?('10:29 PM', true)
		assert_equal true, @m.bedtime?('4:47 AM', true)
		assert_equal true, @m.bedtime?('4:47 AM,', false)
	end
	
	def test_difference_in_percentages
		assert_equal '1.0%', @m.difference_in_percentages(315360,637200)
		assert_equal '1.0%', @m.difference_in_percentages(637200,315360)
		assert_equal '50.0%', @m.difference_in_percentages(0,15768000)
	end

end
