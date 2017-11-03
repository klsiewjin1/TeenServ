# only delete users created through seeds.rb, using new instead of create to bypass validate logic
User.where(password_digest: nil).delete_all
User.new(fname: 'Kanye', lname: 'West', username: 'kanyes#1fan', user_type: 'client', email: 'kanye.west@mail.utoronto.ca').save(validate: false)
User.new(fname: 'Kendrick', lname: 'Lamar', username: 'poolfullofliquor', user_type: 'client', email: 'kendrick.lamar@mail.utoronto.ca').save(validate: false)
User.new(fname: 'AAA', lname: 'XXX', username: 'aaa', user_type: 'teen', email: 'aaa.xxx@mail.utoronto.ca').save(validate: false)
User.new(fname: 'BBB', lname: 'YYY', username: 'bbb', user_type: 'teen', email: 'bbb.yyy@mail.utoronto.ca').save(validate: false)
User.new(fname: 'CCC', lname: 'ZZZ', username: 'ccc', user_type: 'teen', email: 'ccc.zzz@mail.utoronto.ca').save(validate: false)