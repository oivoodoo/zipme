Given /^I have already generated links$/ do
  @link = create(:link, :user => @user)
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

Given /^someone generated links$/ do
  @someone = create(:user)
  @someone_link = create(:link, :user => @someone)
end

Then /^I should not see edit link near of someone links$/ do
  page.should_not have_selector("#link_#{@someone_link.id} .edit")
end

Then /^I should see edit link only for my links$/ do
  page.should have_selector("#link_#{@link.id} .edit")
end

