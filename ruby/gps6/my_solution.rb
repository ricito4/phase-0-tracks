# Virus Predictor

# I worked on this challenge [by myself, Richie Ito and with: Tolu (Tj) Oyeniyi].
# We spent [1.5] hours on this challenge.

# EXPLANATION OF require_relative
#It allows the my_solution file to have access to the state_data file.
#require_relative let's you reference just the file name in the same
#directory as your current file. While require, needs a file path in order to
#reference the correct file.
require_relative 'state_data'

class VirusPredictor

  #creates a new VirusPredictor instance, and sets the values within
  #this insance using the parameters in the initialize method.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end



  #Calls the methods within it using the given parameters.
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private  

  #checks to see if the population_density meets a certain critria,
  #then multiplies the population by a value specific to each critria.
  #Then, it prints out the prediction of how many deaths for that state.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  #Predicts how many months it'll take the virus to spread depending on the population_density.
  #Then, prints out the results of that method for that state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |key, hash|
  report = VirusPredictor.new(key,hash[:population_density],hash[:population])
  report.virus_effects
end

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end

#=======================================================================

# Reflection Section
=begin
if you want to use a string as your hash label, you use the hash rocket.
this STATE_DATA hash is a Ruby constant, noted by being all caps, meaning that

require relative allows the my_solution file to have access to the state_data file.
require_relative let's you reference just the file name in the same
directory as your current file. While require, needs a file path in order to
reference the correct file.

use .each with different syntax to iterate through a hash

Since we already declaired variables using the @ symbol we didn't need them as 
parameters for methods within our class.

A concept both me and my partner solidified this challenge would be referencing hashes 
=end