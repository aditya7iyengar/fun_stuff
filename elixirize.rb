# Usage:
# def funct(variable, attributes)
#   my_var = Elixirize.new(my_var)

#   my_var
#   .| :to_string
#   .| :include, "hi"
# end


class Elixirize
  def initialize(value)
    @value = value
  end

  def |(funct, params = nil)
    if params
      puts 'here'
      @value = @value.send(funct, params)
    else
      puts 'here 2'
      @value = @value.send(funct)
    end

    self
  end

  def value
    @value
  end
end

variable = 'This is an example of pipe operator in elixir.'

variable = Elixirize.new(variable)

variable = variable
.|(:downcase)
.|(:include?, "hi")

puts variable.value
