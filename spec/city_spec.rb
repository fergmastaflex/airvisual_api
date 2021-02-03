RSpec.describe AirVisualApi::City do
  subject { described_class.new }

  describe '.nearest_city_by_ip' do
    let(:expected_url) { '/nearest_city' }
    it 'sends the ip in the headers' do
      expect_any_instance_of(AirVisualApi::Client).to receive(:get).with({ url: expected_url, headers: { 'x-forwarded-for' => '123.45.67.890' }})
      subject.nearest_city_by_ip(ip: '123.45.67.890')
    end
  end

  describe '.nearest_city_by_gps' do
    let(:expected_url) { '/nearest_city?lat=123.0&lon=456.0' }
    it 'interpolates the URI correctly' do
      expect_any_instance_of(AirVisualApi::Client).to receive(:get).with({ url: expected_url })
      subject.nearest_city_by_gps(latitude: 123, longitude: 456)
    end
  end

  describe '.city_by_name_and_state' do
    let(:expected_url) { '/city?city=Arlington&state=Virginia&country=USA' }

    it 'interpolates the URI correctly' do
      expect_any_instance_of(AirVisualApi::Client).to receive(:get).with({ url: expected_url })
      subject.city_by_name_and_state(city: 'Arlington', state: 'Virginia')
    end
  end
end
