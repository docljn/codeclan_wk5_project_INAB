# category.rb
require('pry-byebug')

class Category

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end
end



# category.rb
