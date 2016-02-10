module Gh
  class Client::API
    module Milestone
      def repo_milestones(owner, repository)
        resource = "repos/#{owner}/#{repository}/milestones"
        request(:get, resource)
      end

      def repo_milestone(owner, repository, id)
        resource = "repos/#{owner}/#{repository}/milestones/#{id}"
        request(:get, resource)
      end
    end
  end
end
