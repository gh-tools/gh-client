module Gh
  class IssueCollection < Driver::Model
    include Enumerable

    def initialize(api, owner, repository)
      super(api)

      @owner = owner
      @repository = repository
    end

    def each
      issues = @api.repo_issues(@owner, @repository)
      issues.each do |issue|
        yield Gh::Issue.new(@api, issue) if block_given?
      end
    end

    def to_s
      each.map {|issue| Gh::Issue.new(@api, issue) }
    end

    def inspect
      to_s
    end

    def [](idx)
      to_s[idx]
    end
  end
end
