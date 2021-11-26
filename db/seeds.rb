# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'open-uri'
require 'json'
require 'pry-byebug'

results = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/top_rated").read)["results"] #array

results.first(10).each do |result|
  # binding.pry
  Movie.create(
    title: result["title"],
    overview: result["overview"],
    poster_url: "https://www.themoviedb.org/t/p/w440_and_h660_face #{result["poster_path"]}",
    rating: result["vote_average"]
  )
end
