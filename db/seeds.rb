# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying the data'
puts '-------------------'

Colocation.destroy_all
User.destroy_all
Task.destroy_all

puts 'Seeding new Data'
puts '-------------------'

lacoloc = Colocation.create(name: 'Le Wagon')

thomas = User.new(first_name: 'Thomas', email: 'toto@toto.com', password: '123456')
lior = User.new(first_name: 'Lior', email: 'titi@toto.com', password: '123456')
franck = User.new(first_name: 'Franck', email: 'tata@toto.com', password: '123456')

thomas.colocation = lacoloc
lior.colocation = lacoloc
franck.colocation = lacoloc

thomas.save!
lior.save!
franck.save!

vaisselle = Task.new(name: 'Vaisselle', description: 'Il faut faire la vaisselle', duration: 30)
ménage = Task.new(name: 'Ménage', description: 'Il faut faire le ménage', duration: 60)
courses = Task.new(name: 'Courses', description: 'La liste des courses est sur le frigo', duration: 20)

vaisselle.colocation = lacoloc
ménage.colocation = lacoloc
courses.colocation = lacoloc

vaisselle.save!
ménage.save!
courses.save!

assignation1 = Assignation.new(statut:'fait', date: Date.today)
assignation2 = Assignation.new(statut:'en cours', date: Date.today)
assignation3 = Assignation.new(statut:'à faire', date: Date.today)
assignation4 = Assignation.new(statut:'à faire', date: Date.today)

assignation1.task = vaisselle
assignation1.user = thomas
assignation1.save!

assignation2.task = ménage
assignation2.user = lior
assignation2.save!

assignation3.task = courses
assignation3.user = thomas
assignation3.save!

assignation4.task = courses
assignation4.user = franck
assignation4.save!

prefthomas1 = Preference.new(rating: 5)
prefthomas1.user = thomas
prefthomas1.task = vaisselle
prefthomas1.save!
prefthomas2 = Preference.new(rating: 3)
prefthomas1.user = thomas
prefthomas1.task = ménage
prefthomas1.save!
prefthomas3 = Preference.new(rating: 1)
prefthomas1.user = thomas
prefthomas1.task = courses
prefthomas1.save!

preflior1 = Preference.new(rating: 5)
preflior1.user = lior
preflior1.task = ménage
preflior1.save!
preflior2 = Preference.new(rating: 3)
preflior1.user = lior
preflior1.task = courses
preflior1.save!
preflior3 = Preference.new(rating: 1)
preflior1.user = lior
preflior1.task = vaisselle
preflior1.save!

preffranck1 = Preference.new(rating: 5)
prefthomas1.user = thomas
prefthomas1.task = courses
prefthomas1.save!
preffranck2 = Preference.new(rating: 3)
prefthomas1.user = thomas
prefthomas1.task = vaisselle
prefthomas1.save!
preffranck3 = Preference.new(rating: 1)
prefthomas1.user = thomas
prefthomas1.task = ménage
prefthomas1.save!


