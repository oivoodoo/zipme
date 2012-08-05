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

