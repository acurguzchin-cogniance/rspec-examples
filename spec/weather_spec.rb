RSpec.describe 'Weather API' do
  describe 'Call current weather data for one location' do
    context 'when London is given' do
      it 'returns the details' do
        get '/weather?q=London'
        expect(json_body[:cod]).to eq 200
        expect(json_body[:sys][:country]).to eq 'GB'
      end
    end

    context 'when a non-existent city is given' do
      it 'provides the error' do
        get '/weather?q=UnknownCity'
        expect(json_body[:cod]).to eq '404'
        expect(json_body[:message]).to eq 'Error: Not found city'
      end
    end
  end
end
