class Pizza

    attr_accessor :name, :ingredients, :desc

    def initialize(name, ingredients, desc)
        self.name = name
        self.ingredients = ingredients
        self.desc = desc
    end 

    def print_attributes
        puts self.name
        puts self.ingredients
        puts self.desc
    end 

end
