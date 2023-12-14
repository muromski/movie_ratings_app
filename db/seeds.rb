# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

movies_data = [
  { title: "Inception", director: "Christopher Nolan", release_year: 2010, genre: "Sci-Fi", image_url: "inception.jpeg", description: "A mind-bending thriller that explores the concept of dreams within dreams, challenging the boundaries of reality and perception. Dom Cobb, played by Leonardo DiCaprio, is a skilled thief who specializes in entering people's dreams to steal their deepest secrets." },
  { title: "The Shawshank Redemption", director: "Frank Darabont", release_year: 1994, genre: "Drama", image_url: "the_shawshank_redemption.jpeg", description: "A timeless tale of hope and redemption set within the confines of Shawshank State Penitentiary. Andy Dufresne, played by Tim Robbins, forms an unlikely friendship with fellow inmate Red, portrayed by Morgan Freeman, as they navigate the challenges of prison life." },
  { title: "Pulp Fiction", director: "Quentin Tarantino", release_year: 1994, genre: "Crime", image_url: "pulp_fiction.jpeg", description: "A groundbreaking crime film with a nonlinear narrative that weaves together multiple interconnected stories. With its iconic dialogue, memorable characters, and a soundtrack that became an instant classic, 'Pulp Fiction' is a cinematic masterpiece." },
  { title: "The Dark Knight", director: "Christopher Nolan", release_year: 2008, genre: "Action", image_url: "the_dark_knight.jpeg", description: "The caped crusader, Batman, faces his most formidable foe, the Joker, in this intense and gripping sequel. Heath Ledger's portrayal of the Joker is hailed as one of the greatest performances in the history of superhero films." },
  { title: "Forrest Gump", director: "Robert Zemeckis", release_year: 1994, genre: "Drama", image_url: "forrest_gump.jpeg", description: "A heartwarming tale that follows the extraordinary life of Forrest Gump, played by Tom Hanks. From his humble beginnings in Alabama to his adventures through historical events, Forrest's simple wisdom leaves a lasting impact on those around him." },
  { title: "The Godfather", director: "Francis Ford Coppola", release_year: 1972, genre: "Crime", image_url: "the_godfather.jpeg", description: "An epic crime saga that follows the Corleone family's patriarch, Vito Corleone, as he navigates the complex world of organized crime. With its powerful performances and a gripping storyline, 'The Godfather' is a cinematic masterpiece." },
  { title: "Titanic", director: "James Cameron", release_year: 1997, genre: "Romance", image_url: "titanic.jpeg", description: "A sweeping romantic epic set against the backdrop of the ill-fated maiden voyage of the RMS Titanic. Jack and Rose, played by Leonardo DiCaprio and Kate Winslet, find love and face tragedy as the luxurious ship meets its tragic end." },
  { title: "The Matrix", director: "The Wachowskis", release_year: 1999, genre: "Sci-Fi", image_url: "the_matrix.jpeg", description: "A groundbreaking sci-fi film that introduces viewers to a dystopian world where reality is not what it seems. Neo, played by Keanu Reeves, discovers the truth about his existence and joins a rebellion against the machines enslaving humanity." },
  { title: "Schindler's List", director: "Steven Spielberg", release_year: 1993, genre: "Drama", image_url: "schindlers_list.jpeg", description: "A powerful and emotional drama based on the true story of Oskar Schindler, a German businessman who saved the lives of over a thousand Jewish refugees during the Holocaust. 'Schindler's List' is a poignant exploration of humanity's capacity for both cruelty and compassion." },
  { title: "Jurassic Park", director: "Steven Spielberg", release_year: 1993, genre: "Adventure", image_url: "jurassic_park.jpeg", description: "An exhilarating adventure that brings dinosaurs back to life through groundbreaking special effects. Dr. Alan Grant, played by Sam Neill, and his team must navigate the dangers of Jurassic Park when dinosaurs run amok, showcasing the awe and danger of resurrecting extinct creatures." }
]

movies_data.each do |movie|
  Movie.create!(movie)
end

5.times do |i|
  User.create!(
    nickname: "User##{i + 1}",
    about: Faker::Lorem.sentence,
    avatar_url: "user_#{i}_avatar"
  )
end

