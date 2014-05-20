# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Setup.delete_all
# Setup.create(:groups => {'A'=>["BRA","CRO","MEX","CMR"],'B'=>["ESP","NED","CHI","AUS"],'C'=>["COL","GRE","CIV","JPN"],'D'=>["URU","CRC","ENG","ITA"],'E'=>["SUI","ECU","FRA","HON"],'F'=>["ARG","BIH","IRN","NGA"],'G'=>["GER","POR","GHA","USA"],'H'=>["BEL","ALG","RUS","KOR"]})

User.delete_all
Score.delete_all
Forecast.delete_all

User.create(:name => 'Andres Martinez', :mail => 'amartinez0000@gmail.com')
User.create(:name => 'Stella Gutierrez', :mail => 'lstellaguti0000@gmail.com')
User.create(:name => 'Yanny Castrillon', :mail => 'yannytesoro@gmail.com')

Forecast.create(:user_id => 1, :group => 'A', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 2, :group => 'A', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 3, :group => 'A', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 1, :group => 'G', :forecast1 => '3', :forecast2 => '1')
Forecast.create(:user_id => 2, :group => 'G', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 3, :group => 'G', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 1, :group => 'G', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 2, :group => 'G', :forecast1 => '3', :forecast2 => '1')
Forecast.create(:user_id => 3, :group => 'G', :forecast1 => '2', :forecast2 => '1')