require "spec_helper"

describe Force::Field do
  let(:options)   { {} }
  subject(:field) { Force::Field.new(:field_name, options) }

  context "when no type is given" do
    its(:name) { should eq(:field_name) }
    its(:type) { should eq(:string) }

    context "and some options are given" do
      let(:options)   { { custom: :option, foo: 'bar' } }

      its(:options) { should eq(options) }
    end
  end

  context "when type is given" do

    context "as :string" do
      let(:options)   { { type: :string } }

      its(:name) { should eq(:field_name) }
      its(:type) { should eq(:string) }
    end

    context "as :time" do
      let(:options)   { { type: :time } }

      its(:name) { should eq(:field_name) }
      its(:type) { should eq(:time) }
    end

    context "as :date" do
      let(:options)   { { type: :date } }

      its(:name) { should eq(:field_name) }
      its(:type) { should eq(:date) }
    end

    context "and some options are given" do
      let(:options)   { { type: :string, custom: :option, foo: 'bar' } }

      its(:options) { should eq(options.except(:type)) }
    end
  end

  describe "serialization" do
    context "when it is a :string" do
      let(:value)   { double('value', to_s: 'some value') }
      let(:options) { { type: :string } }

      it "calls #to_s on the value" do
        expect(field.serialize(value)).to eq(value.to_s)
      end
    end

    context "when it is a :time" do
      let(:value)   { "2014-04-14T22:05:40Z".to_time }
      let(:options) { { type: :time } }

      it "converts it to a utc iso representation of the time" do
        expect(field.serialize(value)).to eq(value.utc.iso8601)
      end

      context "when value is nil" do
        it "returns nil" do
          expect(field.serialize(nil)).to be_nil
        end
      end
    end

    context "when it is a :date" do
      let(:value)   { "2014-04-14".to_date }
      let(:options) { { type: :date } }

      it "converts it to a iso representation of the date" do
        expect(field.serialize(value)).to eq(value.to_s)
      end

      context "when value is nil" do
        it "returns nil" do
          expect(field.serialize(nil)).to be_nil
        end
      end
    end
  end

  describe "deserialization" do
    context "when it is a :string" do
      let(:value) { double('value', to_s: 'some value') }
      let(:options)   { { type: :string } }

      it "calls #to_s on the value" do
        expect(field.serialize(value)).to eq(value.to_s)
      end
    end

    context "when it is a :time" do
      let(:value)   { "2014-04-14T22:05:40Z" }
      let(:options) { { type: :time } }

      it "converts it to a time representation of the string value" do
        expect(field.deserialize(value)).to eq(value.to_time)
      end

      context "when value is nil" do
        it "returns nil" do
          expect(field.deserialize(nil)).to be_nil
        end
      end
    end

    context "when it is a :date" do
      let(:value)   { "2014-04-14" }
      let(:options) { { type: :date } }

      it "converts it to a date representation of the string value" do
        expect(field.deserialize(value)).to eq(value.to_date)
      end

      context "when value is nil" do
        it "returns nil" do
          expect(field.deserialize(nil)).to be_nil
        end
      end
    end
  end
end
