require_relative '../lib/commander_data'

describe CommanderData do
  let(:bookmark_class) { double :bookmark_class, new: nil}

  describe '#all' do
    it 'returns urls from database' do
      title = 'Google'
      url = 'http://google.com'
      described_class.add(title, url)
      described_class.all(bookmark_class)
      expect(bookmark_class).to have_received(:new).with(title, url)
    end
  end

  describe '#valid' do
    it 'returns false for invalid url' do
      expect(described_class.valid?('Im not a url')).to be false
    end

    it 'returns true for a valid url' do
      expect(described_class.valid?('http://www.google.com')).to be true
    end
  end
end
