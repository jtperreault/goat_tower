Level.delete_all
l1 = Level.create!(position: 1, description: 'ground level')
l2 = Level.create!(position: 2, description: 'second level')
l3 = Level.create!(position: 3, description: 'third level')
l4 = Level.create!(position: 4, description: 'top of the tower')

Situation.delete_all
Situation.create!(level: l1, description: 'you get hit by a goat', health_change: -10)
Situation.create!(level: l1, description: 'you are trampled', health_change: -20)
Situation.create!(level: l2, description: "you've been kicked by Billy", health_change: -13)
Situation.create!(level: l2, description: 'you are ignored by the goats', health_change: 0)
Situation.create!(level: l3, description: 'you fall off the tower', health_change: -100)
Situation.create!(level: l3, description: 'a goat kisses you', health_change: 10)
Situation.create!(level: l4, description: 'kicked!', health_change: -15)
Situation.create!(level: l4, description: 'gored!', health_change: -30)
