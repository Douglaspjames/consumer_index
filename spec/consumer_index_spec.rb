require "spec_helper"
require "consumer_index.rb"



describe ConsumerIndex do
  it "has a version number" do
    expect(ConsumerIndex::VERSION).not_to be nil
  end

 
    context "upon initialization" do
      it "is a ScoringAdvice object" do
        response = { 
          "propensity": 0.26532,
          "ranking": "C" }
        index = ConsumerIndex::ScoringAdvice.new(response)
        expect(index.class).to eq(    ConsumerIndex::ScoringAdvice)
      end
     

      it "has a propensity" do 
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect(index.propensity).to eq( 0.26532)
        end
  
      it "has a ranking" do 
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect(index.ranking).to eq("C")
        end
    end

    describe ConsumerIndex::ScoringAdvice do
      describe '#self.request' do
        it 'raises an exception if there is not 3 parameters' do
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect { index.request(income: "50000")}.to raise_error("parameters must include income, zip_code, and age")
        end

        it 'raises an exception if age is below 21' do
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect { index.request( income: "70000", zip_code: "60068", age: "15" )}.to raise_error("Age must be at least 21")
        end

        it 'raises an exception if zip code is less than 5 numbers' do
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect { index.request( income: "70000", zip_code: "600", age: "26" )}.to raise_error("Zip code must be 5 numbers")
        end

        it 'raises an exception if income is less than "1"' do
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect { index.request( income: "0", zip_code: "60068", age: "26" )}.to raise_error("Income must be greater than 0")
        end
      end
    end
end
