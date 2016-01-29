namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    require 'populator'

    [Band, Album, Track].each(&:delete_all)

    Band.populate 10 do |band|
      band.name = Faker::Hipster.words.join(' ')
    end

    Album.populate 50 do |album|
      album.name = Faker::Hipster.words.join(' ')
      album.band_id = Random.new.rand(1..10)
      if Random.new.rand(0..1) == 0
        album.live_or_studio = 'live'
      else
        album.live_or_studio = 'studio'
      end
    end

    Track.populate 500 do |track|
      track.name = Faker::Hipster.sentence
      track.album_id = Random.new.rand(1..50)
      if Random.new.rand(0..1) == 0
        track.regular_or_bonus = 'live'
      else
        track.regular_or_bonus = 'studio'
      end
      track.lyrics = Faker::Hipster.paragraph
    end
  end
end
