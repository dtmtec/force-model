require "spec_helper"

describe Force::Model do
  describe ".field" do
    let(:klass) do
      Class.new do
        include Force::Model
      end
    end

    it "adds a field to the model class" do
      klass.field(:test)
      expect(klass.fields[:test]).to be_an(Force::Field)
    end

    it "accepts a type as a parameter" do
      expect(klass.field(:test, type: :string).type).to eq(:string)
    end

    it "pass additional options to the field" do
      expect(klass.field(:test, type: :string, custom_option: true).options).to eq({ custom_option: true })
    end

    it "adds a getter for the instance" do
      klass.field(:test)
      instance = klass.new(test: 'some data')

      expect(instance.test).to eq('some data')
    end

    it "adds a setter for the instance" do
      klass.field(:test)
      instance = klass.new
      instance.test = 'some data'

      expect(instance.test).to eq('some data')
    end
  end

  describe "receiving attributes when initializing" do
    subject(:model) { CustomObject.new(attributes) }
    let(:attributes) { { name: 'Some name', description: "Some Description", published_at: "2014-04-11T20:56:06.000+0000", birthdate: "2014-03-13T00:00:00.000+0000" } }

    it "can access name attributes" do
      expect(model.name).to eq(attributes[:name])
    end

    it "can access description attributes" do
      expect(model.description).to eq(attributes[:description])
    end

    it "can access time fields" do
      expect(model.published_at).to be_present
    end

    it "can access date fields" do
      expect(model.birthdate).to be_present
    end
  end
end
