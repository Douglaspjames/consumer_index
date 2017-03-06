require "spec_helper"


CISA = ConsumerIndex::ScoringAdvice

describe ConsumerIndex do
  it "has a version number" do
    expect(ConsumerIndex::VERSION).not_to be nil
  end

  describe '#self.request' do
    context "upon initialization" do
      it "is a ScoringAdvice object" do
        response = { 
          "propensity": 0.26532,
          "ranking": "C" }
        index = ConsumerIndex::ScoringAdvice.new(response)
        expect(index.class).to eq(    ConsumerIndex::ScoringAdvice)
      end
     
  


      # it "has a propensity" do 
      #   expect(index.propensity).to eq( 0  .26532)
      #   end
  
      it "has a ranking" do 
        response = { 
          "propensity": 0.26532,
          "ranking": "C" }
        index = ConsumerIndex::ScoringAdvice.new(propensity: 0.26532,
          ranking: "C")
        expect(index.ranking).to eq("C")
        end

    end
  end



end
