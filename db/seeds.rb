# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Setup.delete_all
=begin

require 'httparty'



Game.delete_all
(1..15).each  do |x|
	response = HTTParty.get("http://footballdb.herokuapp.com/api/v1/event/world.2014/round/#{x}")

  response.to_hash["games"].each do |game| 
  	puts "--------------------------------------"
  	puts game

  	Game.create(:team1 => game["team1_code"].to_s, :team2 => game["team2_code"].to_s, 
  		:play_at => game["play_at"], :score1 => nil, :score2 => nil, :result => nil, 
  		:processed => false, :round => x)
  end
end

Score.delete_all
=end
Setup.delete_all


Setup.create(:groups => {'A'=>["BRA","CRO","MEX","CMR"],
						'B'=>["ESP","NED","CHI","AUS"],
						'C'=>["COL","GRE","CIV","JPN"],
						'D'=>["URU","CRC","ENG","ITA"],
						'E'=>["SUI","ECU","FRA","HON"],
						'F'=>["ARG","BIH","IRN","NGA"],
						'G'=>["GER","POR","GHA","USA"],
						'H'=>["BEL","ALG","RUS","KOR"]},
						:finalists => [],
						:teams => {'BRA'=>"Brasil",'CRO'=>"Croacia",'MEX'=>"Mexico",'CMR'=>"Camerun",
							'ESP'=>"Espana",'NED'=>"Paises Bajos",'CHI'=>"Chile",'AUS'=>"Australia",
							'COL'=>"Colombia",'GRE'=>"Grecia",'CIV'=>"Costa de Marfil",'JPN'=>"Japon",
							'URU'=>"Uruguay",'CRC'=>"Costa Rica",'ENG'=>"Inglaterra",'ITA'=>"Italia",
							'SUI'=>"Suiza",'ECU'=>"Ecuador",'FRA'=>"Francia",'HON'=>"Honduras",
							'ARG'=>"Argentina",'BIH'=>"Bosnia",'IRN'=>"Iran",'NGA'=>"Nigeria",
							'GER'=>"Alemania",'POR'=>"Portugal",'GHA'=>"Ghana",'USA'=>"EEUU",
							'BEL'=>"Belgica",'ALG'=>"Argelia",'RUS'=>"Rusia",'KOR'=>"Corea Del Sur"})

=begin
User.delete_all
Score.delete_all
Forecast.delete_all

User.create(:name => 'LINA ZULUAGA', :mail => '')
User.create(:name => 'ELIZABETH', :mail => '')
User.create(:name => 'ALESSANDRA', :mail => '')
User.create(:name => 'SARA', :mail => '')
User.create(:name => 'LAURA', :mail => '')
User.create(:name => 'MARTA', :mail => '')
User.create(:name => 'MARISOL', :mail => '')
User.create(:name => 'OLGA', :mail => '')
User.create(:name => 'YAMILE', :mail => ')
User.create(:name => 'YANNETH', :mail => '')
User.create(:name => 'JOSE', :mail => '')
User.create(:name => 'FRANCISCO', :mail => '')
User.create(:name => 'LESLIE', :mail => '')
User.create(:name => 'GUSTAVO', :mail => '')
User.create(:name => 'VANESSA', :mail => '')
User.create(:name => 'ANDRES JARAMILLO', :mail => '')
User.create(:name => 'JAIVER', :mail => '')
User.create(:name => 'ANDRES MARTINEZ', :mail => '')
User.create(:name => 'AUGUSTO', :mail => '')
User.create(:name => 'JAIME', :mail => '')
User.create(:name => 'ADRIAN', :mail => '')

Forecast.create(:user_id => 1, :group => '20', :forecast1 => 'USA', :forecast2 => 'HON')
Forecast.create(:user_id => 1, :group => '19', :forecast1 => 'BRA', :forecast2 => 'CHI')
Forecast.create(:user_id => 1, :group => 'A', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 1, :group => 'B', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 1, :group => 'C', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 1, :group => 'D', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 1, :group => 'E', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 1, :group => 'F', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 1, :group => 'G', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 1, :group => 'H', :forecast1 => '1', :forecast2 => '1')

Forecast.create(:user_id => 2, :group => '20', :forecast1 => 'NGA', :forecast2 => 'ENG')
Forecast.create(:user_id => 2, :group => '19', :forecast1 => 'COL', :forecast2 => 'ESP')
Forecast.create(:user_id => 2, :group => 'A', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 2, :group => 'B', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 2, :group => 'C', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 2, :group => 'D', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 2, :group => 'E', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 2, :group => 'F', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 2, :group => 'G', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 2, :group => 'H', :forecast1 => '0', :forecast2 => '1')

Forecast.create(:user_id => 3, :group => '20', :forecast1 => 'COL', :forecast2 => 'ALG')
Forecast.create(:user_id => 3, :group => '19', :forecast1 => 'CHI', :forecast2 => 'GER')
Forecast.create(:user_id => 3, :group => 'A', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 3, :group => 'B', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 3, :group => 'C', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 3, :group => 'D', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 3, :group => 'E', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 3, :group => 'F', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 3, :group => 'G', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 3, :group => 'H', :forecast1 => '0', :forecast2 => '1')

Forecast.create(:user_id => 4, :group => '20', :forecast1 => 'CIV', :forecast2 => 'NGA')
Forecast.create(:user_id => 4, :group => '19', :forecast1 => 'ENG', :forecast2 => 'ARG')
Forecast.create(:user_id => 4, :group => 'A', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 4, :group => 'B', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 4, :group => 'C', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 4, :group => 'D', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 4, :group => 'E', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 4, :group => 'F', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 4, :group => 'G', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 4, :group => 'H', :forecast1 => '2', :forecast2 => '1')

Forecast.create(:user_id => 5, :group => '20', :forecast1 => 'NED', :forecast2 => 'BIH')
Forecast.create(:user_id => 5, :group => '19', :forecast1 => 'ECU', :forecast2 => 'ARG')
Forecast.create(:user_id => 5, :group => 'A', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 5, :group => 'B', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 5, :group => 'C', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 5, :group => 'D', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 5, :group => 'E', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 5, :group => 'F', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 5, :group => 'G', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 5, :group => 'H', :forecast1 => '1', :forecast2 => '0')

Forecast.create(:user_id => 6, :group => '20', :forecast1 => 'USA', :forecast2 => 'IRN')
Forecast.create(:user_id => 6, :group => '19', :forecast1 => 'BEL', :forecast2 => 'NGA')
Forecast.create(:user_id => 6, :group => 'A', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 6, :group => 'B', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 6, :group => 'C', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 6, :group => 'D', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 6, :group => 'E', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 6, :group => 'F', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 6, :group => 'G', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 6, :group => 'H', :forecast1 => '2', :forecast2 => '0')

Forecast.create(:user_id => 7, :group => '20', :forecast1 => 'ESP', :forecast2 => 'CIV')
Forecast.create(:user_id => 7, :group => '19', :forecast1 => 'ARG', :forecast2 => 'GRE')
Forecast.create(:user_id => 7, :group => 'A', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 7, :group => 'B', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 7, :group => 'C', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 7, :group => 'D', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 7, :group => 'E', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 7, :group => 'F', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 7, :group => 'G', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 7, :group => 'H', :forecast1 => '0', :forecast2 => '1')

Forecast.create(:user_id => 8, :group => '20', :forecast1 => 'ARG', :forecast2 => 'NED')
Forecast.create(:user_id => 8, :group => '19', :forecast1 => 'ESP', :forecast2 => 'NGA')
Forecast.create(:user_id => 8, :group => 'A', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 8, :group => 'B', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 8, :group => 'C', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 8, :group => 'D', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 8, :group => 'E', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 8, :group => 'F', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 8, :group => 'G', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 8, :group => 'H', :forecast1 => '0', :forecast2 => '1')

Forecast.create(:user_id => 9, :group => '20', :forecast1 => 'ENG', :forecast2 => 'ARG')
Forecast.create(:user_id => 9, :group => '19', :forecast1 => 'URU', :forecast2 => 'CRC')
Forecast.create(:user_id => 9, :group => 'A', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 9, :group => 'B', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 9, :group => 'C', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 9, :group => 'D', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 9, :group => 'E', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 9, :group => 'F', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 9, :group => 'G', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 9, :group => 'H', :forecast1 => '2', :forecast2 => '1')

Forecast.create(:user_id => 10, :group => '20', :forecast1 => 'POR', :forecast2 => 'ALG')
Forecast.create(:user_id => 10, :group => '19', :forecast1 => 'ENG', :forecast2 => 'HON')
Forecast.create(:user_id => 10, :group => 'A', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 10, :group => 'B', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 10, :group => 'C', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 10, :group => 'D', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 10, :group => 'E', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 10, :group => 'F', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 10, :group => 'G', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 10, :group => 'H', :forecast1 => '2', :forecast2 => '1')

Forecast.create(:user_id => 11, :group => '20', :forecast1 => 'ENG', :forecast2 => 'NED')
Forecast.create(:user_id => 11, :group => '19', :forecast1 => 'URU', :forecast2 => 'COL')
Forecast.create(:user_id => 11, :group => 'A', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 11, :group => 'B', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 11, :group => 'C', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 11, :group => 'D', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 11, :group => 'E', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 11, :group => 'F', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 11, :group => 'G', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 11, :group => 'H', :forecast1 => '2', :forecast2 => '0')

Forecast.create(:user_id => 12, :group => '20', :forecast1 => 'COL', :forecast2 => 'CHI')
Forecast.create(:user_id => 12, :group => '19', :forecast1 => 'JPN', :forecast2 => 'GER')
Forecast.create(:user_id => 12, :group => 'A', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 12, :group => 'B', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 12, :group => 'C', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 12, :group => 'D', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 12, :group => 'E', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 12, :group => 'F', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 12, :group => 'G', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 12, :group => 'H', :forecast1 => '2', :forecast2 => '1')

Forecast.create(:user_id => 13, :group => '20', :forecast1 => 'MEX', :forecast2 => 'FRA')
Forecast.create(:user_id => 13, :group => '19', :forecast1 => 'HON', :forecast2 => 'NED')
Forecast.create(:user_id => 13, :group => 'A', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 13, :group => 'B', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 13, :group => 'C', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 13, :group => 'D', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 13, :group => 'E', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 13, :group => 'F', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 13, :group => 'G', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 13, :group => 'H', :forecast1 => '2', :forecast2 => '1')

Forecast.create(:user_id => 14, :group => '20', :forecast1 => 'GHA', :forecast2 => 'COL')
Forecast.create(:user_id => 14, :group => '19', :forecast1 => 'ECU', :forecast2 => 'NGA')
Forecast.create(:user_id => 14, :group => 'A', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 14, :group => 'B', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 14, :group => 'C', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 14, :group => 'D', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 14, :group => 'E', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 14, :group => 'F', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 14, :group => 'G', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 14, :group => 'H', :forecast1 => '0', :forecast2 => '2')

Forecast.create(:user_id => 15, :group => '20', :forecast1 => 'ITA', :forecast2 => 'HON')
Forecast.create(:user_id => 15, :group => '19', :forecast1 => 'MEX', :forecast2 => 'KOR')
Forecast.create(:user_id => 15, :group => 'A', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 15, :group => 'B', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 15, :group => 'C', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 15, :group => 'D', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 15, :group => 'E', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 15, :group => 'F', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 15, :group => 'G', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 15, :group => 'H', :forecast1 => '1', :forecast2 => '0')

Forecast.create(:user_id => 16, :group => '20', :forecast1 => 'ECU', :forecast2 => 'POR')
Forecast.create(:user_id => 16, :group => '19', :forecast1 => 'HON', :forecast2 => 'NGA')
Forecast.create(:user_id => 16, :group => 'A', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 16, :group => 'B', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 16, :group => 'C', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 16, :group => 'D', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 16, :group => 'E', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 16, :group => 'F', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 16, :group => 'G', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 16, :group => 'H', :forecast1 => '0', :forecast2 => '2')

Forecast.create(:user_id => 17, :group => '20', :forecast1 => 'ARG', :forecast2 => 'MEX')
Forecast.create(:user_id => 17, :group => '19', :forecast1 => 'ITA', :forecast2 => 'USA')
Forecast.create(:user_id => 17, :group => 'A', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 17, :group => 'B', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 17, :group => 'C', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 17, :group => 'D', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 17, :group => 'E', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 17, :group => 'F', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 17, :group => 'G', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 17, :group => 'H', :forecast1 => '0', :forecast2 => '2')

Forecast.create(:user_id => 18, :group => '20', :forecast1 => 'CRC', :forecast2 => 'SUI')
Forecast.create(:user_id => 18, :group => '19', :forecast1 => 'CMR', :forecast2 => 'BEL')
Forecast.create(:user_id => 18, :group => 'A', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 18, :group => 'B', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 18, :group => 'C', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 18, :group => 'D', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 18, :group => 'E', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 18, :group => 'F', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 18, :group => 'G', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 18, :group => 'H', :forecast1 => '1', :forecast2 => '2')

Forecast.create(:user_id => 19, :group => '20', :forecast1 => 'ESP', :forecast2 => 'GER')
Forecast.create(:user_id => 19, :group => '19', :forecast1 => 'MEX', :forecast2 => 'ECU')
Forecast.create(:user_id => 19, :group => 'A', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 19, :group => 'B', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 19, :group => 'C', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 19, :group => 'D', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 19, :group => 'E', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 19, :group => 'F', :forecast1 => '2', :forecast2 => '1')
Forecast.create(:user_id => 19, :group => 'G', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 19, :group => 'H', :forecast1 => '1', :forecast2 => '2')

Forecast.create(:user_id => 20, :group => '20', :forecast1 => 'FRA', :forecast2 => 'ESP')
Forecast.create(:user_id => 20, :group => '19', :forecast1 => 'ALG', :forecast2 => 'IRN')
Forecast.create(:user_id => 20, :group => 'A', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 20, :group => 'B', :forecast1 => '0', :forecast2 => '2')
Forecast.create(:user_id => 20, :group => 'C', :forecast1 => '2', :forecast2 => '2')
Forecast.create(:user_id => 20, :group => 'D', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 20, :group => 'E', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 20, :group => 'F', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 20, :group => 'G', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 20, :group => 'H', :forecast1 => '2', :forecast2 => '1')

Forecast.create(:user_id => 21, :group => '20', :forecast1 => 'GRE', :forecast2 => 'ECU')
Forecast.create(:user_id => 21, :group => '19', :forecast1 => 'IRN', :forecast2 => 'ENG')
Forecast.create(:user_id => 21, :group => 'A', :forecast1 => '2', :forecast2 => '0')
Forecast.create(:user_id => 21, :group => 'B', :forecast1 => '0', :forecast2 => '1')
Forecast.create(:user_id => 21, :group => 'C', :forecast1 => '1', :forecast2 => '2')
Forecast.create(:user_id => 21, :group => 'D', :forecast1 => '3', :forecast2 => '0')
Forecast.create(:user_id => 21, :group => 'E', :forecast1 => '1', :forecast2 => '0')
Forecast.create(:user_id => 21, :group => 'F', :forecast1 => '0', :forecast2 => '0')
Forecast.create(:user_id => 21, :group => 'G', :forecast1 => '1', :forecast2 => '1')
Forecast.create(:user_id => 21, :group => 'H', :forecast1 => '2', :forecast2 => '2')#
=end
