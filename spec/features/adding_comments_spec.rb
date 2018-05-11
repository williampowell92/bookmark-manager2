xfeature 'adding comments' do
  let(:comment) { 'I am a comment' }

  scenario 'adding comment to bookmark' do
    visit('/bookmarks')
    click_button('Add comment')
    fill_in('comment', with: comment)
    click_button('Save')
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_content(comment)
  end
end
