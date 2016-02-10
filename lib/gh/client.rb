require "driver"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/object/try"

module Gh
  class Client < Driver::Client
    drive Repository, Issue, Milestone

    def initialize(user, password, **options)
      require "ostruct"

      @api = API.new(user, password, options)
    end

    attr_reader :api

    def user
      @api.user
    end
  end
end
