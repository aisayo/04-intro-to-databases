class Starship 

    @@all = [] 

    attr_accessor :name, :model, :color
    attr_reader :id
    
    def initialize(attributes) 
        attributes.each do |key, value| 
            if self.respond_to?("#{key.to_s}=")
                self.send("#{key.to_s}=", value)
            end 
        end
    end

    def save 
        if self.id
            self.update
        else 
            sql = <<-SQL
                INSERT INTO starships (name, model, color) VALUES (?, ?, ?);
            SQL

            DB.execute(sql, self.name, self.model, self.color)
            @id = DB.last_insert_row_id
        end 
        self 
    end

    def update 
        sql = <<-SQL
           UPDATE starships SET name = ?, model = ?, color = ? WHERE id = ?
        SQL

        DB.execute(sql, self.name, self.model, self.color, self.id)
        self
    end

    def self.all 
        array_of_hashes = DB.execute("SELECT * FROM starships")
        array_of_hashes.collect do |hash|
          self.new(hash)
        end
    end

    def self.find(name)
        self.all.find do |starship|
            starship.name == name
        end 
    end

    def self.create_table 
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS starships (
            id INTEGER PRIMARY KEY, 
            name TEXT,
            model TEXT,
            color TEXT
        );
        SQL
        DB.execute(sql)
    end

end 

binding.pry