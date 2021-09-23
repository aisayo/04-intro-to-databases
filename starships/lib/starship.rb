class Starship 

    @@all = [] 

    attr_accessor :name, :model, :color 

    def initialize(attributes) 
        attributes.each do |key, value| 
            self.send("#{key}=", value) 
        end
        save
    end

    def save 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def self.find(name)
        self.all.find do |starship|
            starship.name == name
        end 
    end 

end 