When /^I fill link form$/ do
  fill_in "link[url]", :with => "http://www.example.com"
end

When /^I press generate button$/ do
  click_on "Generate"
end

Then /^I should see generated link$/ do
  sleep 3

  link = Link.last

  within '#links' do
    page.should have_content(link.key)
  end
end

Then /^I should see successful notification$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see edit button near of generated link$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I have already generated links$/ do
  @link = create(:link)
end

Then /^I should see list with my generated links$/ do
  within '#links' do
    page.should have_content(@link.key)
  end
end

Then /^I should see edit buttons near of the links$/ do
  within '#links' do
    find('.edit').should be
  end
end

When /^I changed details of the first link$/ do
  click_on 'Edit'

  fill_in 'link[key]', :with => 'new_key'

  sleep 2

  click_on 'Save'
end

Then /^I should see changed details in the list$/ do
  within '#links' do
    find('.key').should have_content('new_key')
  end
end

