class Starship 

    @@all = [] 

    attr_accessor :starship_name, :model, :color
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
                INSERT INTO starships (starship_name, model, color) VALUES (?, ?, ?);
            SQL

            DB.execute(sql, self.starship_name, self.model, self.color)
            @id = DB.last_insert_row_id
        end 
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
        # write a query that creates the table 
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS starships (
            id INTEGER PRIMARY KEY, 
            starship_name TEXT,
            model TEXT,
            color TEXT
        );
        SQL
        DB.execute(sql)
    end 

    def update 
        sql = <<-SQL
           UPDATE starships SET starship_name = ?, model = ?, color = ? WHERE id = ?
        SQL

        DB.execute(sql, self.starship_name, self.model, self.color, self.id)
        self
    end

end 

binding.pry