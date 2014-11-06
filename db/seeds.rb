# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

introduction_text = ''
line_length = 40
line_length.times do
    introduction_text += ' '
end
introduction_text += '          Welcome to Telltales          '
    18.times do
        line_length.times do
        introduction_text += ' '
    end
end
introduction = StoryText.create([{passage: introduction_text, author: "Brian Cottrell"}])