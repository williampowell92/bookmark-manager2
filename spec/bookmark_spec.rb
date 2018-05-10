require_relative '../lib/bookmark'

describe Bookmark do

  describe '#all' do
    it 'returns urls from database' do
      Bookmark.add('http://google.com')
      Bookmark.add('http://destroyallsoftware.com')
      Bookmark.add('http://outlook.com')
      expect(described_class.all).to eq(['http://google.com', 'http://destroyallsoftware.com', 'http://outlook.com'])
    end
  end

  describe '#add' do
    it 'adds a bookmark to the database' do
      described_class.add('http://google.com')
      expect(described_class.all).to eq(['http://google.com'])
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
