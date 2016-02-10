module Gh
  module Concerns
    class Issue < Driver::Model
      def initialize(api, issue)
        super(api)
        load_info(issue)
      end
  
      attr_reader :url, :number, :title, :user, :labels,
                  :state, :assignee, :comments, :created_at,
                  :updated_at, :closed_at, :body
  
      def to_s
        OpenStruct.new(instance_variables.each_with_object({}) do |(sym), new_obj|
          new_obj[sym] = instance_variable_get(sym) unless sym == :@api
        end)
      end
  
      def inspect
        to_s
      end
  
      private
  
      def load_info(issue)
        @url        = issue["url"]
        @number     = issue["number"]
        @title      = issue["title"]
        @user       = issue["user"]
        @labels     = issue["labels"]
        @state      = issue["state"]
        @assignee   = issue["assignee"]
        @comments   = issue["comments"]
        @created_at = issue["created_at"]
        @updated_at = issue["updated_at"]
        @closed_at  = issue["closed_at"]
        @body       = issue["body"]
      end
    end
  end
end
