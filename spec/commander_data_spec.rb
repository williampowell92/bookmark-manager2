require_relative '../lib/commander_data'

describe CommanderData do
  let(:bookmark_class) { double :bookmark_class, new: nil}
  let(:connection) { double :database_connection, exec: rs }
  let(:id) { '1' }
  let(:title) { 'Google' }
  let(:url) { 'http://www.google.com' }
  let(:incorrect_title) { 'Boogle' }
  let(:incorrect_url) { 'http://www.goggle.com' }
  let(:rs) {[{'id' => id, 'title' => title, 'url' => url}]}

  describe '#all' do
    it 'returns urls from database' do
      described_class.all(bookmark_class, connection)
      expect(bookmark_class).to have_received(:new).with(id, title, url)
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

  describe '#add' do
    it 'returns the sql stuff' do
      title = 'Google'
      url = 'http://google.com'
      described_class.add(title, url, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}')")
    end
  end

  describe '#delete' do
    it 'deletes the row' do
      described_class.add(title, url)
      described_class.delete(id, connection)
      expect(connection).to have_received(:exec).with("DELETE FROM bookmarks WHERE id = '#{id}'")
    end
  end

  describe '#update' do
    fit 'updates an entry' do
      described_class.add(incorrect_title, incorrect_url)
      described_class.update(id, title, url, connection)
      expect(connection).to have_received(:exec).with("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}'")
    end
  end
end
