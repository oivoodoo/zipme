Given /^I have a link$/ do
  @link = create(:link)
end

Then /^I should see link in the list$/ do
  within '#links' do
    find('.key').should have_content(@link.url)
  end
end

