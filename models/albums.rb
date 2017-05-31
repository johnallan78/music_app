require 'pg'
require_relative '../db/sql_runner'

class Album

  attr_accessor :id, :title, :genre


  def initialize(details)
      @id = details['id'].to_i() if details['id']
      @title = details['title']
      @genre = details['genre']
      @artist_id = details['artist_id'].to_i

  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING id "
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i 
  end


  # def update()

  # end

  def self.all()
      sql = "SELECT * FROM albums "
      result = SqlRunner.run(sql)
      return result.map { |order_result| Album.new(order_result)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    artist_found = result[0]
    artist = Artist.new(artist_found)
    return artist
  end


end