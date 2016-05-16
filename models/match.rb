require( 'pg' )
require_relative('../db/sql_runner')
require 'date'

class Match

  attr_accessor( :id, :at_id, :ht_id, :at_score, :ht_score, :match_date)

  def initialize( options )
    @id = options['id'].to_i
#    @name = options['name']
    @at_score = options['at_score'].to_i
    @ht_score = options['ht_score'].to_i
    @ht_id = options['ht_id'].to_i
    @at_id = options['at_id'].to_i
  end

  def save() #save always create a new one? #how do i know what teams are?
    sql = "INSERT INTO matches (
    at_score, 
    ht_score, 
    at_id, 
    ht_id, 
    match_date) VALUES (
    '#{ @at_score}', 
    '#{ @ht_score}', 
    '#{ @at_id}',
    '#{ @ht_id }',
    '#{Date.today}'
    ) RETURNING *"
    return Match.map_item( sql)
  end

  def self.all()
    sql = "SELECT * FROM matches"
    return Match.map_items(sql)
  end

  def self.delete_all
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    trainers = SqlRunner.run( sql )
    result = trainers.map { |trainer| Match.new( trainer ) }
    return result
  end

  def self.map_item(sql)
    result = Match.map_items(sql)
    return result.first
  end

  # def pokemons()
  #   sql = " select p.* FROM pokemons p INNER JOIN ownedpokemons op ON op.pokemon_id = p.id WHERE trainer_id = #{@id};"
  #   return Pokemon.map_items(sql)
  # end

end
