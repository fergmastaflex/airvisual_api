RSpec.describe AirVisualApi::City do
  subject { described_class.new }

  before { expect_any_instance_of(AirVisualApi::Client).to receive(:get).with({ url: expected_url }) }

  describe '.nearest_city_by_gps' do
    let(:expected_url) { '/nearest_city?lat=123.0&lon=456.0' }
    it 'interpolates the URI correctly' do
      subject.nearest_city_by_gps(latitude: 123, longitude: 456)
    end
  end

  describe '.city_by_name_and_state' do
    let(:expected_url) { '/city?city=Arlington&state=Virginia&country=USA' }

    it 'interpolates the URI correctly' do
      subject.city_by_name_and_state(city: 'Arlington', state: 'Virginia')
    end
  end
end
