module Gh
  class Client
    model Issue, IssueCollection

    module Issue
      def issues
        Gh::IssueCollection.new(@api, @owner, @repository)
      end

      def issue(id)
        issue = @api.repo_issue(@owner, @repository, id)
        Gh::Issue.new(@api, issue)
      end
    end
  end
end
