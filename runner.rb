require('pry')
require_relative('models/bounty.rb')

first_target = { 'name' => 'Boba Fett', 'species' => 'human', 'bounty_value' => '750', 'danger_level' => 'red alert' }

my_bounty = Bounty.new(first_target)

second_target = { 'name' => 'Willy', 'species' => 'killer whale', 'bounty_value' => '25', 'danger_level' => 'low' }


my_other_bounty = Bounty.new(second_target)
#
# my_bounty.save_to_db()
# my_other_bounty.save_to_db()
#
all_bounties = Bounty.get_all_bounties_from_db()
# p all_bounties.length
#
# bounty_to_delete = all_bounties[18]
# bounty_to_delete.delete_from_db()
#
# all_bounties = Bounty.get_all_bounties_from_db()
# p all_bounties.length
#
# Bounty.delete_many([all_bounties[17],all_bounties[18],all_bounties[19]])
#
# all_bounties = Bounty.get_all_bounties_from_db()
# p all_bounties.length
#
Bounty.remove_duplicates(all_bounties)
#
# all_bounties = Bounty.get_all_bounties_from_db()
# p all_bounties
#p Bounty.get_all_bounties_from_db()

# name = Bounty.find_by_name("Boba Fett")
# p name

# Bounty.remove_duplicates(all_bounties)
#
# all_bounties = Bounty.get_all_bounties_from_db()
# p all_bounties

p Bounty.find_by_id_only(2)
