def add_bookmark(title, url)
  click_link('add bookmark')
  fill_in('new-bookmark', with: url)
  fill_in('new-title', with: title)
  click_button('Save')
end
