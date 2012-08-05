Then /^I should not see offline status message$/ do
  page.should have_selector("#offline-status", :visible => false)
end

When /^my internet connection go down$/ do
  go_offline
end

Then /^I should see offline status message$/ do
  page.should have_selector("#offline-status", :visible => true)
end

When /^my internet connection come back$/ do
  go_online
end

