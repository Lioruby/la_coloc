puts 'Destroying the data'
puts '-------------------'

Colocation.destroy_all

puts 'Seeding new Data'
puts '-------------------'

lacoloc = Colocation.create!(name: 'Le Wagon')
user_images = ["https://avatars1.githubusercontent.com/u/71550958?s=400&u=5d9c2518ae08db91fa3742fff381ec6a364efd1d&v=4","https://avatars3.githubusercontent.com/u/61694823?s=460&u=41edf0546a675388bb39e187a44770b53bf500e0&v=4","https://avatars2.githubusercontent.com/u/71385272?s=460&u=d515496e33750499be8feae11fa4ce6a92613b3d&v=4", "https://cv.jpheos.fr/assets/images/jpheos.jpg"]
task_photos = ['https://images.unsplash.com/photo-1581622558667-3419a8dc5f83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80','https://images.unsplash.com/photo-1585421514284-efb74c2b69ba?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80']


thomas = User.new(first_name: 'Thomas', email: 'toto@toto.com', password: '123456')
lior = User.new(first_name: 'Lior', email: 'titi@toto.com', password: '123456')
franck = User.new(first_name: 'Franck', email: 'tata@toto.com', password: '123456')

thomas.photo.attach(io: URI.open(user_images[0]), filename: 'photo.jpg', content_type: 'image/jpg')
thomas.colocation = lacoloc

lior.photo.attach(io: URI.open(user_images[2]), filename: 'photo.jpg', content_type: 'image/jpg')
lior.colocation = lacoloc

franck.photo.attach(io: URI.open(user_images[1]), filename: 'photo.jpg', content_type: 'image/jpg')
franck.colocation = lacoloc


thomas.save!
lior.save!
franck.save!

vaisselle = Task.new(name: 'Vaisselle', description: 'Il faut faire la vaisselle', duration: 30, recurrence: "quotidien")
ménage = Task.new(name: 'Ménage', description: 'Il faut faire le ménage', duration: 60, recurrence: "hebdomadaire")
courses = Task.new(name: 'Courses', description: 'La liste des courses est sur le frigo', duration: 20, recurrence: "hebdomadaire")
aspirateur = Task.new(name: 'Passer laspirateur puis la serpillère et faut se depêcher', description: 'il faut passer laspirateur', duration: 30, recurrence: "quotidien")


vaisselle.colocation = lacoloc
ménage.colocation = lacoloc
courses.colocation = lacoloc
aspirateur.colocation = lacoloc

vaisselle.save!
ménage.save!
courses.save!
aspirateur.save!


# assignation1 = Assignation.new(statut: true, date: Date.today)
# assignation2 = Assignation.new(statut: false, date: Date.today)
# assignation3 = Assignation.new(statut: false, date: Date.today)
# assignation4 = Assignation.new(statut: false, date: Date.today)
# assignation5 = Assignation.new(statut: false, date: "Thu, 1 Dec 2020")
# assignation6 = Assignation.new(statut: false, date: "Wed, 2 Dec 2020")
# assignation7 = Assignation.new(statut: false, date: "Wed, 2 Dec 2020")
# assignation8 = Assignation.new(statut: false, date: "Wed, 2 Dec 2020")
# assignation9 = Assignation.new(statut: false, date: "Thu, 3 Dec 2020")
# assignation10 = Assignation.new(statut: false, date: "Thu, 3 Dec 2020")
# assignation11 = Assignation.new(statut: false, date: "Thu, 3 Dec 2020")
# assignation12 = Assignation.new(statut: false, date: "Thu, 3 Dec 2020")
# # assignation13 = Assignation.new(statut: false, date: "Fri, 4 Dec 2020")

# assignation1.photo.attach(io: URI.open(task_photos[0]), filename: 'photo.jpg', content_type: 'image/jpg')
# assignation1.task = vaisselle
# assignation1.user = franck
# assignation1.save!

# assignation2.photo.attach(io: URI.open(task_photos[1]), filename: 'photo.jpg', content_type: 'image/jpg')
# assignation2.task = ménage
# assignation2.user = lior
# assignation2.save!

# assignation3.task = courses
# assignation3.user = thomas
# assignation3.save!

# assignation4.task = vaisselle
# assignation4.user = franck
# assignation4.save!

# assignation5.task = vaisselle
# assignation5.user = thomas
# assignation5.save!

# assignation6.task = vaisselle
# assignation6.user = lior
# assignation6.save!

# assignation7.task = vaisselle
# assignation7.user = franck
# assignation7.save!

# assignation8.task = vaisselle
# assignation8.user = thomas
# assignation8.save!

# assignation9.task = vaisselle
# assignation9.user = thomas
# assignation9.save!

# assignation10.task = ménage
# assignation10.user = franck
# assignation10.save!

# assignation11.task = aspirateur
# assignation11.user = thomas
# assignation11.save!

# assignation12.task = courses
# assignation12.user = lior
# assignation12.save!

# assignation13.task = vaisselle
# assignation13.user = franck
# assignation13.save!

prefthomas1 = Preference.new(position: 0)
prefthomas1.user = thomas
prefthomas1.task = vaisselle
prefthomas1.save!


prefthomas2 = Preference.new(position: 1)
prefthomas2.user = thomas
prefthomas2.task = ménage
prefthomas2.save!


prefthomas3 = Preference.new(position: 2)
prefthomas3.user = thomas
prefthomas3.task = courses
prefthomas3.save!

preflior1 = Preference.new(position: 0)
preflior1.user = lior
preflior1.task = ménage
preflior1.save!


preflior2 = Preference.new(position: 1)
preflior2.user = lior
preflior2.task = courses
preflior2.save!


preflior3 = Preference.new(position: 2)
preflior3.user = lior
preflior3.task = vaisselle
preflior3.save!

preffranck1 = Preference.new(position: 0)
preffranck1.user = franck
preffranck1.task = courses
preffranck1.save!


preffranck2 = Preference.new(position: 1)
preffranck2.user = franck
preffranck2.task = vaisselle
preffranck2.save!


preffranck3 = Preference.new(position: 2)
preffranck3.user = franck
preffranck3.task = ménage
preffranck3.save!

depense1 = Depense.new(montant: 25.3, name: 'Tournée')
depense1.user = franck
depense1.save!
franck.balance += depense1.montant
franck.save!
depense2 = Depense.new(montant: 15.3, name: 'Courses')
depense2.user = lior
depense2.save!
lior.balance += depense2.montant
lior.save!
depense3 = Depense.new(montant: 12.6, name: 'Produits ménagers')
depense3.user = thomas
depense3.save!
thomas.balance += depense3.montant
thomas.save!

lacoloc.users.each do |user|
  lacoloc.balance += user.balance
end
lacoloc.balance = lacoloc.balance.round(2)
lacoloc.save!
