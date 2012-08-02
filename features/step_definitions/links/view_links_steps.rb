Given /^I have a link$/ do
  @link = create(:link, :url => '/login')
end

Then /^I should see link in the list$/ do
  within '#links' do
    find('.key').should have_content(@link.short)
    find('.url').should have_content(@link.url)
  end
end

When /^I follow by generated link$/ do
  click_on @link.short
end

Then /^I should be on the page that was pasted for making short version$/ do
  current_path.should match(/\/login/)
end

