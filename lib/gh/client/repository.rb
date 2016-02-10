module Gh
  class Client
    module Repository
      def open(owner: nil, repository: nil)
        @owner = owner if owner
        @repository = repository if repository
        (owner && repository) ? self : { owner: @owner, repository: @repository }
      end
    end
  end
end
