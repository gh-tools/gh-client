module Gh
  class Client::API
    module Issue
      def repo_issues(owner, repository)
        resource = "repos/#{owner}/#{repository}/issues?state=all"
        request(:get, resource)
      end

      def repo_issue(owner, repository, id)
        resource = "repos/#{owner}/#{repository}/issues/#{id}"
        request(:get, resource)
      end
    end
  end
end
