require 'bookmark'

describe Bookmark do
  subject {Bookmark.new('Google', 'http://www.google.com')}

  describe '#title' do
    it 'returns the title' do
      expect(subject.title).to eq 'Google'
    end
  end

  describe '#url' do
    it 'returns the url' do
      expect(subject.url).to eq 'http://www.google.com'
    end
  end
end
