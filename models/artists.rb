require 'pg'
require_relative '../db/sql_runner'


class Artist

  attr_reader :id, :name



def initialize(details)
  @id = details['id'].to_i
  @name = details['name']
end

def save()
  sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING * ;"
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i
end

def update()
  sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
  SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

def self.all()
  sql = "SELECT ALL FROM artists;"
  artists = SqlRunner.new(sql)
  return artists.map {|artist| Artist.new(artist)}

end

def self.delete_all()
  sql = "DELETE FROM albums;"
  SqlRunner.run(sql)
end

def album()
  sql = "SELECT * FROM albums WHERE artist_id = #{id} ;"
  result = SqlRunner.run(sql)
  orders = result.map { |order| Album.new(order)}
  return orders
end




end