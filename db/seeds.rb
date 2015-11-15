Level.delete_all
l0 = Level.create!(position: 0, description: 'Outside the Goat Tower.')
l1 = Level.create!(position: 1, description: 'Enter the tower.')
l2 = Level.create!(position: 2, description: 'Goat Tower second floor.')
l3 = Level.create!(position: 3, description: 'Goat Tower third floor.')
l4 = Level.create!(position: 4, description: 'Goat Tower fourth floor.')

Situation.delete_all
Situation.create!(level: l0, description: 'You enter the tower unchallenged.', health_change: 0)
Situation.create!(level: l1, description: 'You trip as you enter the tower and fall into goat poop.', health_change: -10)
Situation.create!(level: l1, description: 'A goat kicks you in the face as you enter the door.', health_change: -20)
Situation.create!(level: l2, description: "you've been kicked by Billy", health_change: -13)
Situation.create!(level: l2, description: 'you are ignored by the goats', health_change: 0)
Situation.create!(level: l3, description: 'you fall off the tower', health_change: -100)
Situation.create!(level: l3, description: 'a goat kisses you', health_change: 10)
Situation.create!(level: l4, description: 'kicked!', health_change: -15)
Situation.create!(level: l4, description: 'gored!', health_change: -30)
