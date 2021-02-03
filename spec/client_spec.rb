RSpec.describe AirVisualApi::Client do
  before { allow(HTTParty).to receive(:get) }
  let(:base_url) { 'http://api.airvisual.com/v2' }
  let(:key_param) { '&key=12345' }
  let(:expected_url) { base_url + '/cities?state=WA' + key_param }

  subject { described_class.new(api_key: '12345') }

  it 'sends get request to API' do
    expect(HTTParty).to receive(:get).with(expected_url)
    subject.get(url: '/cities?state=WA')
  end
end
