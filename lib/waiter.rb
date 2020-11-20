class Waiter

    attr_accessor :name, :age
    @@all = []
    def initialize(name, years)
        @name = name 
        @years = years
        @@all << self 
    end 
    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def self.all
        @@all
    end 

    def meals 
        Meal.all.select {|meal| meal.waiter == self }
    end 

    def best_tipper
        meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end.customer 
    end 
      
end