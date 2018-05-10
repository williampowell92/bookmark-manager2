require_relative '../lib/commander_data'

describe CommanderData do
  let(:bookmark_class) { double :bookmark_class, new: nil}
  let(:connection) { double :database_connection, exec: nil }

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
      title = 'Google'
      url = 'http://google.com'
      described_class.add(title, url)
      described_class.delete(title, connection)
      expect(connection).to have_received(:exec).with("DELETE FROM bookmarks WHERE title = '#{title}'")
    end
  end

  fdescribe '#update' do
    it 'updates an entry' do
      old_title = 'Boogle'
      old_url = 'http://goggle.com'
      new_title = 'Google'
      new_url = 'http://google.com'
      described_class.add(old_title, old_url)
      described_class.update(old_title, new_title, new_url, connection)
      expect(connection).to have_received(:exec).with("UPDATE bookmarks SET title = '#{new_title}', url = '#{new_url}' WHERE title = '#{old_title}'")

    end
  end
end
