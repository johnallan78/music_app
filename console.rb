require 'pry-byebug'
require_relative 'models/albums'
require_relative 'models/artists'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
      'name' => 'The Beatles'
  })

artist2 = Artist.new({
      'name' => 'Charles Mingus'
  })

artist3 = Artist.new({
      'name' => 'Igor Stravinsky'
  })

artist1.save()
artist2.save()
artist3.save()


album1 = Album.new({
      'title' => 'Revolver',
      'genre' => '60s Rock',
      'artist_id' => artist1.id
  })

album2 = Album.new({
      'title' => 'Mingus Ah Um',
      'genre' => 'Jazz',
      'artist_id' => artist2.id
  })

album3 = Album.new({
      'title' => 'Rite Of Spring',
      'genre' => 'Modern Classical',
      'artist_id' => artist3.id
  })

album1.save()
album2.save()
album3.save()

album1.artist()
artist1.album()

binding.pry
nil

