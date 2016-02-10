module Gh
  class Client
    model Milestone, MilestoneCollection

    module Milestone
      def milestones
        Gh::MilestoneCollection.new(@api, @owner, @repository)
      end

      def milestone(id)
        milestone = @api.repo_milestone(@owner, @repository, id)
        Gh::Milestone.new(@api, milestone)
      end
    end
  end
end
