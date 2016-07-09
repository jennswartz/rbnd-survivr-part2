class Tribe

attr_accessor :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "#{@name} tribe has been created."
  end
  
  def to_s
    @name
  end
  
  def tribal_council(immune={})
    @members.reject { |member| member == immune[:immune] }.sample
    # I think I need to delete someone here?
  end
  
  def delete(members)
    @members.delete(members)
  end
  
end