class Pokemon

attr_accessor :db, :id, :name, :type


def initialize(db)

@db = db
@id = @db[:id]
@name = @db[:name]
@type = @db[:type]

end

def self.save(name, type, db)
db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end

def self.find(id, db)
	poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
	Pokemon.new(id: poke[0], name: poke[1], type: poke[2], hp: poke[3], db: db)
end



end
