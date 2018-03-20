require('pry')
require('pg')

class Bounty

attr_reader :id
attr_accessor :name, :species, :bounty_value, :danger_level

  def initialize( bounty_info )

    @name = bounty_info['name']
    @species = bounty_info['species']
    @bounty_value = bounty_info['bounty_value'].to_i
    @danger_level = bounty_info['danger_level']
    @id = bounty_info['id']

  end

  def save_to_db()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )

    sql = "
    INSERT INTO bounties
      (name, species, bounty_value, danger_level)
      VALUES
      ($1, $2, $3, $4);
    "

    values = [@name, @species, @bounty_value, @danger_level]

    db.prepare("save", sql)
    db.exec_prepared("save", values)

  end

  def update()

  end

  def delete()

  end


end



# Create a Ruby file for your Bounty class - Bounty
# Write your class definition in the file - initialize, attr_readers, instance variables

# Implement save, update and delete methods on your class
