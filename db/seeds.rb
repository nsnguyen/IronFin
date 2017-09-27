require 'csv'

puts 'Seeding movie.del'
movies_text = File.read(Rails.root.join('lib', 'seeds', 'movie.del'))
csv = CSV.parse(movies_text, :headers => false)
csv.each do |row|
  t = Movie.new
  t.id = row[0]
  t.title = row[1]
  t.year = row[2]
  t.rating = row[3]
  t.company = row[4]
  t.save
end

puts 'Seeding actor1.del'
actor1_text = File.read(Rails.root.join('lib', 'seeds', 'actor1.del'))
csv = CSV.parse(actor1_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Actor.new
  t.id = row[0]
  t.last = row[1]
  t.first = row[2]
  t.sex = row[3]
  t.dob = row[4]
  t.dod = row[5]
  t.save
end

puts 'Seeding actor2.del'
actor2_text = File.read(Rails.root.join('lib', 'seeds', 'actor2.del'))
csv = CSV.parse(actor2_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Actor.new
  t.id = row[0]
  t.last = row[1]
  t.first = row[2]
  t.sex = row[3]
  t.dob = row[4]
  t.dod = row[5]
  t.save
end

puts 'Seeding actor3.del'
actor3_text = File.read(Rails.root.join('lib', 'seeds', 'actor3.del'))
csv = CSV.parse(actor3_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Actor.new
  t.id = row[0]
  t.last = row[1]
  t.first = row[2]
  t.sex = row[3]
  t.dob = row[4]
  t.dod = row[5]
  t.save
end

puts 'Seeding director.del'
director_text = File.read(Rails.root.join('lib', 'seeds', 'director.del'))
csv = CSV.parse(director_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Director.new
  t.id = row[0]
  t.last = row[1]
  t.first = row[2]
  t.dob = row[3]
  t.dod = row[4]
  t.save
end

puts 'Seeding movieactor1.del'
movieactor1_text = File.read(Rails.root.join('lib', 'seeds', 'movieactor1.del'))
csv = CSV.parse(movieactor1_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = MovieActor.new
  t.mid = row[0]
  t.aid = row[1]
  t.role = row[2]
  t.save
end

puts 'Seeding movieactor2.del'
movieactor2_text = File.read(Rails.root.join('lib', 'seeds', 'movieactor2.del'))
csv = CSV.parse(movieactor2_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = MovieActor.new
  t.mid = row[0]
  t.aid = row[1]
  t.role = row[2]
  t.save
end

puts 'Seeding moviedirector.del'
moviedirector_text = File.read(Rails.root.join('lib', 'seeds', 'moviedirector.del'))
csv = CSV.parse(moviedirector_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = MovieDirector.new
  t.mid = row[0]
  t.did = row[1]
  t.save
end

puts 'Seeding moviegenre.del'
moviegenre_text = File.read(Rails.root.join('lib', 'seeds', 'moviegenre.del'))
csv = CSV.parse(moviegenre_text, :headers => false, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = MovieGenre.new
  t.mid = row[0]
  t.genre = row[1]
  t.save
end