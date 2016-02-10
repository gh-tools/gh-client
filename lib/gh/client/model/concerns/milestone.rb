module Gh
  module Concerns
    class Milestone < Driver::Model
      def initialize(api, milestone)
        super(api)
        load_info(milestone)
      end

      attr_reader :number, :title, :description, :state

      def to_s
        OpenStruct.new(instance_variables.each_with_object({}) do |(sym), new_obj|
          new_obj[sym] = instance_variable_get(sym) unless sym == :@api
        end)
      end

      def inspect
        to_s
      end

      private

      def load_info(milestone)
        @number = milestone["number"]
        @title  = milestone["title"]
        @description = milestone["description"]
        @state = milestone["state"]
      end
    end
  end
end
