require "test_helper"

describe Animal do
  let(:animal) { Animal.new }

  it "must be valid" do
    value(animal).must_be :valid?
  end
end
