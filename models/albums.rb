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
  end


  def update()
  end

  def self.all()
  end

  def artist()
  end


end