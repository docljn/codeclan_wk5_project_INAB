# account.rb
require('pry-byebug')

class Account
  
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'] if options[id]
    @name = options['name']
  end

end




# account.rb
