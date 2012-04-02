module Bishl
  class ScheduleLine

    include Virtus

    attribute :position, :Integer


    attr_accessor :team
    
    def initialize
      @team = ScheduleTeam.new
    end

    def hashify
      self.attributes.merge!({:team => @team.attributes})
    end
    
    def method_missing(method, *arguments, &block)
      #puts method.to_s
      match = method.to_s =~/create_/
      #puts match
      if match
        name = method.to_s.split("_")[1]

        if(name=="position")
          self.send("position=", arguments.pop)
        else
          @team.send("#{name}=", arguments.pop)
        end
      else
        super
      end
    end

  end
end