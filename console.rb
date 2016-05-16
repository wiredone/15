require_relative( 'models/match.rb' )
require_relative( 'models/team.rb' )

require( 'pry-byebug' )

Match.delete_all()
Team.delete_all()


team1 = Team.new({'name' => 'Scunthorpe','location'=>'Scunthorpe'})
team2 = Team.new({'name' => 'CodeClan United','location' => 'Embrah'}) # 
team3 = Team.new({'name' => 'Those fuckers in blue','location' => 'nimby central'})
t1 = team1.save
t2 = team2.save
t3 = team3.save


match1 = Match.new({ 'at_score' => 3, 'ht_score' =>4, 'at_id' => t1.id,'ht_id' => t2.id})
match2 = Match.new({ 'at_score' => 3, 'ht_score' =>4, 'at_id' => t2.id,'ht_id' => t2.id})
match3= Match.new({ 'at_score' => 3, 'ht_score' =>4, 'at_id' => t3.id,'ht_id' => t2.id})
                                                                                                          

p1 = match1.save  #This creates the serial
p2 = match2.save
p3 = match3.save


binding.pry
nil
