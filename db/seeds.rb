puts 'Destroying the data'
puts '-------------------'
Colocation.destroy_all
puts 'Seeding new Data'
puts '-------------------'
lacoloc = Colocation.create!(name: 'Le Wagon')
user_images = ["https://avatars1.githubusercontent.com/u/71550958?s=400&u=5d9c2518ae08db91fa3742fff381ec6a364efd1d&v=4","https://avatars3.githubusercontent.com/u/61694823?s=460&u=41edf0546a675388bb39e187a44770b53bf500e0&v=4","https://avatars2.githubusercontent.com/u/71385272?s=460&u=d515496e33750499be8feae11fa4ce6a92613b3d&v=4", "https://cv.jpheos.fr/assets/images/jpheos.jpg"]
task_photos = ['https://images.unsplash.com/photo-1581622558667-3419a8dc5f83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80','https://images.unsplash.com/photo-1585421514284-efb74c2b69ba?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80','https://images.pexels.com/photos/5824498/pexels-photo-5824498.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','https://images.pexels.com/photos/5691488/pexels-photo-5691488.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','https://images.pexels.com/photos/5824498/pexels-photo-5824498.jpeg?auto=compress&cs=tinysrgb&h=650&w=940','https://5.imimg.com/data5/JK/PW/KM/SELLER-37907573/cat-litter-bentonite-pet-litter-bentonite-powder--500x500.png']
thomas = User.new(first_name: 'Thomas', email: 'th.farre@gmail.com', password: '123456')
lior = User.new(first_name: 'Lior', email: 'levy.lior.pro@gmail.com', password: '123456')
franck = User.new(first_name: 'Franck', email: 'franck.siguier@gmail.com', password: '123456')
thomas.photo.attach(io: URI.open(user_images[0]), filename: 'photo.jpg', content_type: 'image/jpg')
thomas.colocation = lacoloc
lior.photo.attach(io: URI.open(user_images[2]), filename: 'photo.jpg', content_type: 'image/jpg')
lior.colocation = lacoloc
franck.photo.attach(io: URI.open(user_images[1]), filename: 'photo.jpg', content_type: 'image/jpg')
franck.colocation = lacoloc
thomas.save!
lior.save!
franck.save!
vaisselle = Task.new(name: 'Faire la Vaisselle', description: 'Il faut faire la vaisselle', duration: 20, recurrence: "quotidien")
ménage = Task.new(name: 'Faire le Ménage', description: 'Il faut faire le ménage', duration: 60, recurrence: "hebdomadaire")
courses = Task.new(name: 'Faire les Courses', description: 'La liste des courses est sur le frigo', duration: 90, recurrence: "hebdomadaire")
cuisine = Task.new(name: 'Faire la Cuisine', description: 'Blablabal', duration: 40, recurrence: "quotidien")
litiere = Task.new(name: 'Changer la litière', description: 'Changer la litière du chat', duration: 5, recurrence: "hebdomadaire")
vaisselle.colocation = lacoloc
ménage.colocation = lacoloc
courses.colocation = lacoloc
cuisine.colocation = lacoloc
litiere.colocation = lacoloc
vaisselle.save!
ménage.save!
courses.save!
cuisine.save!
litiere.save!
assignation1 = Assignation.new(statut: true, date: Date.today)
assignation2 = Assignation.new(statut: false, date: Date.today)
assignation3 = Assignation.new(statut: false, date: "Thu, 1 Dec 2020")
assignation4 = Assignation.new(statut: false, date: "Thu, 1 Dec 2020")
assignation5 = Assignation.new(statut: true, date: "Thu, 1 Dec 2020")
assignation6 = Assignation.new(statut: true, date: "Wed, 2 Dec 2020")
assignation7 = Assignation.new(statut: true, date: "Wed, 2 Dec 2020")
assignation8 = Assignation.new(statut: true, date: "Wed, 2 Dec 2020")
assignation9 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation10 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation11 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation12 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation13 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation14 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation15 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation16 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation17 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation18 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation19 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation20 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation21 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation22 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation23 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation24 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation25 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation26 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation27 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation28 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation29 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation30 = Assignation.new(statut: true, date: "Thu, 3 Dec 2020")
assignation1.photo.attach(io: URI.open(task_photos[0]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation1.task = vaisselle
assignation1.user = franck
assignation1.save!
assignation2.task = courses
assignation2.user = thomas
assignation2.save!
assignation3.task = vaisselle
assignation3.user = thomas
assignation3.save!
# assignation4.task = ménage
# assignation4.user = thomas
# assignation4.save!
assignation14.task = cuisine
assignation14.user = thomas
assignation14.save!
assignation15.task = vaisselle
assignation15.user = thomas
assignation15.save!
assignation16.task = vaisselle
assignation16.user = thomas
assignation16.save!
assignation17.task = vaisselle
assignation17.user = franck
assignation17.save!
assignation18.task = litiere
assignation18.user = franck
assignation18.save!
assignation19.task = cuisine
assignation19.user = franck
assignation19.save!
assignation20.task = litiere
assignation20.user = franck
assignation20.save!
assignation21.task = courses
assignation21.user = franck
assignation21.save!
assignation22.task = ménage
assignation22.user = lior
assignation22.save!
assignation23.task = ménage
assignation23.user = lior
assignation23.save!
assignation24.task = cuisine
assignation24.user = lior
assignation24.save!
assignation26.task = litiere
assignation26.user = lior
assignation26.save!
assignation27.task = ménage
assignation27.user = lior
assignation27.save!
assignation28.task = vaisselle
assignation28.user = lior
assignation28.save!
assignation29.task = vaisselle
assignation29.user = thomas
assignation29.save!
assignation30.task = vaisselle
assignation30.user = franck
assignation30.save!
assignation5.photo.attach(io: URI.open(task_photos[1]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation5.task = vaisselle
assignation5.user = thomas
assignation5.save!
assignation10.task = ménage
assignation10.user = franck
assignation10.save!
assignation7.photo.attach(io: URI.open(task_photos[3]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation7.task = ménage
assignation7.user = franck
assignation7.save!
assignation6.photo.attach(io: URI.open(task_photos[2]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation6.task = vaisselle
assignation6.user = lior
assignation6.save!
assignation11.task = litiere
assignation11.user = thomas
assignation11.save!
assignation12.task = courses
assignation12.user = lior
assignation12.save!
assignation8.photo.attach(io: URI.open(task_photos[4]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation8.task = vaisselle
assignation8.user = thomas
assignation8.save!
assignation13.task = vaisselle
assignation13.user = franck
assignation13.save!
assignation9.photo.attach(io: URI.open(task_photos[5]), filename: 'photo.jpg', content_type: 'image/jpg')
assignation9.task = litiere
assignation9.user = thomas
assignation9.save!
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
prefthomas4 = Preference.new(position: 3)
prefthomas4.user = thomas
prefthomas4.task = cuisine
prefthomas4.save!
prefthomas5 = Preference.new(position: 4)
prefthomas5.user = thomas
prefthomas5.task = litiere
prefthomas5.save!
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
preflior4 = Preference.new(position: 3)
preflior4.user = lior
preflior4.task = cuisine
preflior4.save!
preflior5 = Preference.new(position: 4)
preflior5.user = lior
preflior5.task = litiere
preflior5.save!
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
preffranck4 = Preference.new(position: 3)
preffranck4.user = franck
preffranck4.task = cuisine
preffranck4.save!
preffranck5 = Preference.new(position: 4)
preffranck5.user = franck
preffranck5.task = litiere
preffranck5.save!
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
