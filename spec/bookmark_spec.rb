require_relative '../lib/bookmark'

describe Bookmark do

  describe '#all' do
    it 'responds to it' do
      expect(described_class).to respond_to(:all)
    end

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

end
