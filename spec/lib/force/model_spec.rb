require "spec_helper"

describe Force::Model do
  describe "receiving attributes when initializing" do
    subject(:model) { CustomObject.new(attributes) }
    let(:attributes) { { name: 'Some name', description: "Some Description", published_at: "2014-04-11T20:56:06.000+0000", birthdate: "2014-03-13T00:00:00.000+0000" } }

    it "can access name attributes" do
      expect(model.name).to eq(attributes[:name])
    end

    it "can access description attributes" do
      expect(model.description).to eq(attributes[:description])
    end

    it "converts time fields to corresponding time" do
      expect(model.published_at).to eq(Time.parse(attributes[:published_at]))
    end

    it "converts date fields to corresponding date" do
      expect(model.birthdate).to eq(Time.parse(attributes[:birthdate]))
    end
  end
end
