local Animal = Class.create("Animal")

function Animal.init(self, species, name, age, weight)
  self.species = species
  self.name = name
  self.age = age
  self.weight = weight
end

function Animal.to_string(self)
  print( "Class Name: %s\n" +
         "Species: %s\n" +
         "Name: %s\n" +
         "Age: %d years old\n" +
         "weight: %s\n",
        Animal:getClassname(), self.species, self.name, self.age, self.weight)
end
