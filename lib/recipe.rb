# wrapper class to make instances of Recipe fromm the data in the API response



class Recipe
  attr_reader :name, :id, :photo, :ingredients, :diet_labels, :uri
 def initialize(name, id, options = {})
   raise ArgumentError if name == nil || name == "" || id == nil || id == ""

   @name = name
   @id = id
   @photo = options[:photo]
   @url = options[:url]
   # TODO: format ingredients into a more readable format in the initialize
   @ingredients = options[:ingredients]
   @diet_labels = options[:diet_labels]
   @uri = options[:uri]
 end # initialize
end
