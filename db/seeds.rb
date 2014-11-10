# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

line_length = 40
first_introduction_text = ''
second_introduction_text = ''
third_introduction_text = ''
fourth_introduction_text = ''
fifth_introduction_text = ''

first_introduction_text += '                                        '
first_introduction_text += '         Golf Course Mayham             '
first_introduction_text += '                                        '
first_introduction_text += ' To contribute to the story please read '
first_introduction_text += ' the following description along with   '
first_introduction_text += ' the unfinished story, then enter a     '
first_introduction_text += ' passage that builds upon the previous  '
first_introduction_text += ' entries                                '
first_introduction_text += '                                        '
first_introduction_text += 'This story takes place on a golf course '
first_introduction_text += 'in Alaska and icludes the following     '
first_introduction_text += 'characters:                             '
first_introduction_text += '    Professor Tom                       '
first_introduction_text += '    Pilot April                         '
first_introduction_text += '    Detective Eloise                    '
first_introduction_text += '    Chef George                         '
first_introduction_text += '    Doctor Joyce                        '
first_introduction_text += '    Owlen the caddie                    '
first_introduction_text += '                                        '
first_introduction_text += '                                        '

second_introduction_text += '                                        '
second_introduction_text += '              Egg Story                 '
second_introduction_text += '                                        '
second_introduction_text += ' To contribute to the story please read '
second_introduction_text += ' the following description along with   '
second_introduction_text += ' the unfinished story, then enter a     '
second_introduction_text += ' passage that builds upon the previous  '
second_introduction_text += ' entries                                '
second_introduction_text += '                                        '
second_introduction_text += ' After wandering off on a class field   '
second_introduction_text += ' trip, programming instructors Alex,    '
second_introduction_text += ' Alfonzo, Grant, Lorin, Meredith,       '
second_introduction_text += ' Richard, and Zach come across a        '
second_introduction_text += ' mysterious giant that appears to have  '
second_introduction_text += ' something living inside.               '
second_introduction_text += '                                        '
second_introduction_text += '                                        '
second_introduction_text += '                                        '
second_introduction_text += '                                        '
second_introduction_text += '                                        '

third_introduction_text += '                                        '
third_introduction_text += '        A Day at the Airport            '
third_introduction_text += '                                        '
third_introduction_text += ' To contribute to the story please read '
third_introduction_text += ' the following description along with   '
third_introduction_text += ' the unfinished story, then enter a     '
third_introduction_text += ' passage that builds upon the previous  '
third_introduction_text += ' entries                                '
third_introduction_text += '                                        '
third_introduction_text += ' This story takes place at an airport   '
third_introduction_text += ' where travellers Jamie, Carly, Oliver, '
third_introduction_text += ' and Basil are completely unaware of    '
third_introduction_text += ' imminant dangers they are about to     '
third_introduction_text += ' face.                                  '
third_introduction_text += '                                        '
third_introduction_text += '                                        '
third_introduction_text += '                                        '
third_introduction_text += '                                        '
third_introduction_text += '                                        '
third_introduction_text += '                                        '

fourth_introduction_text += '                                        '
fourth_introduction_text += '         Thanksgiving Dinner            '
fourth_introduction_text += '                                        '
fourth_introduction_text += ' To contribute to the story please read '
fourth_introduction_text += ' the following description along with   '
fourth_introduction_text += ' the unfinished story, then enter a     '
fourth_introduction_text += ' passage that builds upon the previous  '
fourth_introduction_text += ' entries                                '
fourth_introduction_text += '                                        '
fourth_introduction_text += ' This begins when Darcys lavish         '
fourth_introduction_text += ' Thanksgiving dinner party in suddenly  '
fourth_introduction_text += ' interrupted by an invasion of enemy    '
fourth_introduction_text += ' forces and Darcy and her guests must   '
fourth_introduction_text += ' fight to stay alive.                   '
fourth_introduction_text += ' Guests include:                        '
fourth_introduction_text += '    Judge Robert Anderson               '
fourth_introduction_text += '    Congresswoman Libby Harris          '
fourth_introduction_text += '    Lobbyist Ron Marland                '
fourth_introduction_text += '    Mailman Jeff McDowell               '
fourth_introduction_text += '                                        '

fifth_introduction_text += '                                        '
fifth_introduction_text += '               Open Book                '
fifth_introduction_text += '                                        '
fifth_introduction_text += ' To contribute to the story please read '
fifth_introduction_text += ' the unfinished story, then enter a     '
fifth_introduction_text += ' passage that builds upon the previous  '
fifth_introduction_text += ' entries                                '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '
fifth_introduction_text += '                                        '

introduction1 = FirstStoryText.create([{passage: first_introduction_text, author: "Brian Cottrell"}])
introduction2 = SecondStoryText.create([{passage: second_introduction_text, author: "Brian Cottrell"}])
introduction3 = ThirdStoryText.create([{passage: third_introduction_text, author: "Brian Cottrell"}])
introduction4 = FourthStoryText.create([{passage: fourth_introduction_text, author: "Brian Cottrell"}])
introduction5 = FifthStoryText.create([{passage: fifth_introduction_text, author: "Brian Cottrell"}])