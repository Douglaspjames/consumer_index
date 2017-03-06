require "consumer_index/version"
require "unirest"


module ConsumerIndex
  class ScoringAdvice
    attr_accessor :propensity, :ranking, :income, :zip_code, :age

    def initialize(index)
      @propensity = index[:propensity].to_f
      @ranking = index[:ranking]
    end

    def request(data)
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
      if income && zip_code && age
        case 
          when income < "1"
            raise Exception.new("Income must be greater than 0")
          when zip_code.length < 5 
            raise Exception.new("Zip code must be 5 numbers")
          when age < "21"
            raise Exception.new("Age must be at least 21")
          else
            ScoringAdvice.new(response)
        end
      else
        raise Exception.new("parameters must include income, zip_code, and age")
      end
    end
  end
end
