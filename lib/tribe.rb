require 'colorizr'

class Tribe
attr_accessor :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    team = @members.map { |name| "#{name}" }.join("\n")
    puts "#{@name} ".green + "tribe has been created with the following team members:"
    puts "#{team}".light_blue
    sleep(3)
  end
  
  def to_s
    @name
  end
  
  def tribal_council(immune={})
    @members.reject { |member| member == immune[:immune] }.sample
  end
  
  def delete(members)
    @members.delete(members)
  end  
end