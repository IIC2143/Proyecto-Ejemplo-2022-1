# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
    user = User.create(
        username: Faker::Internet.username,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 6),
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        age: Faker::Number.between(from: 18, to: 65),
        description: Faker::Lorem.paragraph,
        work: Faker::Job.title
    )
    3.times do
        user.publications.create(
            title: Faker::Lorem.sentence,
            content: Faker::Lorem.paragraph
        )
    end
    3.times do
        user.comments.create(
            content: Faker::Lorem.paragraph,
            publication_id: Faker::Number.between(from: 1, to: 60)
        )
    end
end

10.times do
    offer = Offer.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        salary: Faker::Number.between(from: 100000, to: 10000000),
        taken: false,
        business: Faker::Job.field
    )
end
