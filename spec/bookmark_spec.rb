require_relative '../lib/bookmark'

describe Bookmark do
  it 'responds to #all' do
    expect(described_class).to respond_to(:all)
  end
end
