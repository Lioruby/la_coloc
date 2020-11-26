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

vaisselle = Task.new(name: 'la Vaisselle', description: 'Il faut faire la vaisselle', duration: 30)
ménage = Task.new(name: 'le Ménage', description: 'Il faut faire le ménage', duration: 60)
courses = Task.new(name: 'les Courses', description: 'La liste des courses est sur le frigo', duration: 20)


vaisselle.colocation = lacoloc
ménage.colocation = lacoloc
courses.colocation = lacoloc

vaisselle.save!
ménage.save!
courses.save!

assignation1 = Assignation.new(statut: true, date: Date.today)
assignation2 = Assignation.new(statut: false, date: Date.today)
assignation3 = Assignation.new(statut: false, date: Date.today)
assignation4 = Assignation.new(statut: false, date: Date.today)
assignation5 = Assignation.new(statut: false, date: "Thu, 26 Nov 2020")
assignation6 = Assignation.new(statut: false, date: "Thu, 26 Nov 2020")
assignation7 = Assignation.new(statut: false, date: "Sat, 28 Nov 2020")
assignation8 = Assignation.new(statut: false, date: "Fri, 4 Dec 2020")

assignation1.photo.attach(io: URI.open(task_photos[0]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation1.task = vaisselle
assignation1.user = franck
assignation1.save!

assignation2.photo.attach(io: URI.open(task_photos[1]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation2.task = ménage
assignation2.user = lior
assignation2.save!

assignation3.task = courses
assignation3.user = thomas
assignation3.save!

assignation4.task = courses
assignation4.user = franck
assignation4.save!

assignation5.task = vaisselle
assignation5.user = thomas
assignation5.save!

assignation6.task = vaisselle
assignation6.user = thomas
assignation6.save!

assignation7.task = vaisselle
assignation7.user = thomas
assignation7.save!

assignation8.task = vaisselle
assignation8.user = thomas
assignation8.save!


prefthomas1 = Preference.new(position: 0)
prefthomas1.user = thomas
prefthomas1.task = vaisselle
prefthomas1.save!
prefthomas2 = Preference.new(position: 1)
prefthomas1.user = thomas
prefthomas1.task = ménage
prefthomas1.save!
prefthomas3 = Preference.new(position: 2)
prefthomas1.user = thomas
prefthomas1.task = courses
prefthomas1.save!

preflior1 = Preference.new(position: 0)
preflior1.user = lior
preflior1.task = ménage
preflior1.save!
preflior2 = Preference.new(position: 1)
preflior1.user = lior
preflior1.task = courses
preflior1.save!
preflior3 = Preference.new(position: 2)
preflior1.user = lior
preflior1.task = vaisselle
preflior1.save!

preffranck1 = Preference.new(position: 0)
prefthomas1.user = thomas
prefthomas1.task = courses
prefthomas1.save!
preffranck2 = Preference.new(position: 1)
prefthomas1.user = thomas
prefthomas1.task = vaisselle
prefthomas1.save!
preffranck3 = Preference.new(position: 2)
prefthomas1.user = thomas
prefthomas1.task = ménage
prefthomas1.save!
2

