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

    sql = '
    INSERT INTO bounties
      (name, species, bounty_value, danger_level)
      VALUES
      ($1, $2, $3, $4);
    '

    values = [@name, @species, @bounty_value, @danger_level]

    db.prepare('save', sql)
    db.exec_prepared('save', values)
    db.close()

  end

  def Bounty.get_all_bounties_from_db()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )

    sql = '
    SELECT * FROM bounties;
    '

    db.prepare('get all bounties', sql)
    all_bounties = db.exec_prepared('get all bounties')
    db.close()

    all_bounties_array = all_bounties.map { |bounty| Bounty.new(bounty) }


  end

  def update_to_db()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )

    sql = '
    UPDATE bounties
      SET (name, species, bounty_value, danger_level) = ($1, $2, $3, $4)
      WHERE id = $5;
    '

    values = [@name, @species, @bounty_value, @danger_level, @id]

    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close()

  end

  def delete_from_db()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )

    sql = '
    DELETE FROM bounties
      WHERE id = $1;
    '

    values = [@id]

    db.prepare('delete', sql)
    db.exec_prepared('delete', values)
    db.close()

  end

  def Bounty.delete_many( array_of_objects)
    for obj in array_of_objects
      obj.delete_from_db()
    end
  end

  def Bounty.remove_duplicates(array_of_objects)
    originals = [] # names
    for bounty_object in array_of_objects
      if originals.include?(bounty_object.name) == false
        originals << bounty_object.name
      else
        bounty_object.delete_from_db()
      end
    end
    return originals
  end

  def Bounty.find_by_name(name)
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )

    sql = "
    SELECT * FROM bounties
      WHERE name = $1;
    "
    value = [name]
    db.prepare('find by name', sql)
    found = db.exec_prepared('find by name', value)
    db.close()
    return found
  end


  # Implement a find_by_name method that returns one instance of your class when a name is passed in, or nil if no instance is found. Note: this will probably be another class method ClassName.find_by_name(name) (do you have to use a map method if it's a single result?)
  # Implement a second find method that returns one instance of your class when an id is passed in.



end
