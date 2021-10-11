# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {
    name: 'admin',
    email: 'admin@example.com',
    password_digest: '$2a$10$HjQH2VBdguACJLyZHoVSs.yBZbwypqY3vUJGnxlWj94rmilWIuWzK',
    role: 1
  },
  {
    name: 'user',
    email: 'user@example.com',
    password_digest: '$2a$10$HjQH2VBdguACJLyZHoVSs.yBZbwypqY3vUJGnxlWj94rmilWIuWzK',
    role: 2
  },
  {
    name: 'bob',
    email: 'bob@example.com',
    password_digest: '$2a$10$HjQH2VBdguACJLyZHoVSs.yBZbwypqY3vUJGnxlWj94rmilWIuWzK',
    role: 3
  },
             ])
Package.create!([
                  {
                    name: 'test',
                    main_assembly: 'hello.c',
                    user: User.find(1),
                    homepage: 'https://example.com',
                    description: 'Hello,World',
                    description_short: 'Hello!!!!World!!!',
                    uuid: 1,
                  },
                ])

Version.create!([
                  {
                    download_url: 'https://example.com',
                    update_note: 'first release',
                    update_note_short: 'Hi,There!',
                    release_datetime: Time.current,
                    package: Package.find_by(:name => 'test')
                  },
                  {
                    download_url: 'https://example.com/a',
                    update_note: 'bug fix',
                    update_note_short: 'hahaha',
                    release_datetime: Time.current,
                    package: Package.find_by(:name => 'test')
                  },
                ])