require('pry')
require_relative('models/bounty.rb')

first_target = { 'name' => 'Boba Fett', 'species' => 'human', 'bounty_value' => '750', 'danger_level' => 'red alert' }

my_bounty = Bounty.new(first_target)

second_target = { 'name' => 'Willy', 'species' => 'killer whale', 'bounty_value' => '25', 'danger_level' => 'low' }

my_other_bounty = Bounty.new(second_target)

my_bounty.save_to_db()
my_other_bounty.save_to_db()
