require "consumer_index/version"
require "unirest"

module ConsumerIndex
  class ScoringAdvice
    def initialize(consumer_data)
      @propensity = consumer_data["propensity"].to_f
      @ranking = consumer_data["ranking"]
    end
  end
end
