# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# only delete users created through seeds.rb, using new instead of create to bypass validate logic
User.where(password_digest: nil).delete_all
client1 = User.new(fname: 'Kanye', lname: 'West', username: 'kanyes#1fan', user_type: 'client', email: 'kanye.west@mail.utoronto.ca').save(validate: false)
client2 = User.new(fname: 'Kendrick', lname: 'Lamar', username: 'poolfullofliquor', user_type: 'client', email: 'kendrick.lamar@mail.utoronto.ca').save(validate: false)
teen1 = User.new(fname: 'AAA', lname: 'XXX', username: 'aaa', user_type: 'teen', email: 'aaa.xxx@mail.utoronto.ca').save(validate: false)
teen2 = User.new(fname: 'BBB', lname: 'YYY', username: 'bbb', user_type: 'teen', email: 'bbb.yyy@mail.utoronto.ca').save(validate: false)
teen3 = User.new(fname: 'CCC', lname: 'ZZZ', username: 'ccc', user_type: 'teen', email: 'ccc.zzz@mail.utoronto.ca').save(validate: false)

Review.delete_all
reviews = Review.create([{ reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, rating: 5 },
                         { reviewer_id: User.all.where(fname: 'BBB').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, rating: 5 },
                         { reviewer_id: User.all.where(fname: 'CCC').first.id, reviewee_id: User.all.where(fname: 'Kanye').first.id, rating: 4 },
                         { reviewer_id: User.all.where(fname: 'AAA').first.id, reviewee_id: User.all.where(fname: 'Kendrick').first.id, rating: 5 },
                         { reviewer_id: User.all.where(fname: 'BBB').first.id, reviewee_id: User.all.where(fname: 'Kendrick').first.id, rating: 4 }])

Service.delete_all
services = Service.create([{ name: 'Babysitting' }, { name: 'Yard Work' }, { name: 'Snow Shovelling' }, { name: 'Furniture Moving' }, { name: 'Simple Cleaning Tasks' }, 
                           { name: 'Vacation Services' }, { name: 'Dog Walking' }, { name: 'Computer Help' }, { name: 'Tutoring' }, { name: 'Reading' }])

ServiceListingGroup.delete_all
service_listing_groups = ServiceListingGroup.create([{ client_id: User.all.where(fname: 'Kanye').first.id, service_id: Service.minimum(:id), hourly_rate: 15.5, description: 'I need babysitting' }, 
                                                     { client_id: User.all.where(fname: 'Kendrick').first.id, service_id: Service.minimum(:id) + 1, hourly_rate: 17.5, description: 'I need yard work' }])

ServiceListing.delete_all
service_listings = ServiceListing.create([{ service_listing_group_id: ServiceListingGroup.minimum(:id), task_date: Date.new(2017, 10, 7) },
                                          { service_listing_group_id: ServiceListingGroup.minimum(:id), task_date: Date.new(2017, 10, 14) },
                                          { service_listing_group_id: ServiceListingGroup.minimum(:id), task_date: Date.new(2017, 10, 21) },
                                          { service_listing_group_id: ServiceListingGroup.minimum(:id) + 1, task_date: Date.new(2017, 10, 25) }])