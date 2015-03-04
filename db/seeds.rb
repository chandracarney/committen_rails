# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "travis",
            provider: "github",
            uid: "203489",
            nickname: "dabomb",
            email: "travis@example.com",
            thumbnail_url: "http://robohash.org/1"
           )

User.create(name: "sam",
            provider: "github",
            uid: "123456",
            nickname: "speedy",
            email: "sam@example.com",
            thumbnail_url: "http://robohash.org/2"
           )

User.create(name: "chandra",
            provider: "github",
            uid: "567890",
            nickname: "@channel",
            email: "travis@example.com",
            thumbnail_url: "http://robohash.org/3"
           )
