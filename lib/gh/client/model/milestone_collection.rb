module Gh
  class MilestoneCollection < Driver::Model
    include Enumerable

    def initialize(api, owner, repository)
      super(api)

      @milestones = @api.repo_milestones(owner, repository)
    end

    def each
      @milestones.each do |milestone|
        yield Gh::Milestone.new(@api, milestone) if block_given?
      end
    end

    def to_s
      each.map {|milestone| Gh::Milestone.new(@api, milestone) }
    end

    def inspect
      to_s
    end

    def [](idx)
      to_s[idx]
    end
  end
end
