require 'open-uri'
require 'json'

# Outputs an array of the dates for when the cubs are playing

url = 'http://chicago.cubs.mlb.com/ticketing-client/json/Game.tiksrv?team_id=112&begin_date=20140226&year=2014&sport_id=1&site_section=SCHEDULE'

response = open(url).read
json_response = JSON.parse(response)

game_dates = json_response['events']['game'].map { |g| g["game_date"] }

# convert the output to use single quotes instead of double
puts game_dates.to_s.tr(?", ?')