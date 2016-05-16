require_relative( 'models/team.rb')
require_relative( 'models/match.rb')
#require_relative('../')


def total_number_of_goals(team)
  both = ["at_score","ht_score"]
  goals = 0
  teamid=teamidfromname(team)
  q1` 445
    sql = "SELECT SUM(#{score}) FROM matches WHERE team_id=#{Team.id"
    result = SqlRunner.run(sql)
    goals += result
  end
 # s elect sum(at_score) from matches where at_id =49; 
end

  def teamidfromname(teamname)
    sql = "select id from teams where( name Like '#{teamname}')"
    team_id=map_item(sql)
    puts team_id
  return team_id
  end


total_number_of_goals("Scunthorpe")


def total_wins
  total = 0
  for team in @teams
    total += win.quanity
  end
  return total
end
