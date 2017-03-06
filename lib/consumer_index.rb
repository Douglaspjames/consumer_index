require "consumer_index/version"
require "unirest"



module ConsumerIndex
  class ScoringAdvice
    attr_accessor :propensity, :ranking

    def initialize(index)
      @propensity = index[:propensity].to_f
      @ranking = index[:ranking]
    end

    def self.request(data)
      income = data[:income].to_s
      zip_code = data[:zip_code].to_s
      age = data[:age].to_s

      response = Unirest.get("http://not_real.com/customer_scoring",
        headers:{ "Accept" => "application/json" },
        parameters: { 
          income: income,
          zip_code: zip_code,
          age: age 
          }).body

      ScoringAdvice.new(response)

    end




  end
end
