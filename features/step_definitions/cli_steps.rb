Given(/^a user exists with the id "([^"]*)"$/) do |arg1|

end

Given(/^I have started the app$/) do
end

Given(/^I have selected to search Zendesk$/) do
  buffer_command('1')
end

When(/^I select "([^"]*)"$/) do |arg1|
  SEARCH_TYPE_TO_OPTION={
      users: '1'
  }
  buffer_command(SEARCH_TYPE_TO_OPTION[:users])
end

When(/^I enter search term "([^"]*)"$/) do |search_term|
  buffer_command(search_term)
end

When(/^I enter search value "([^"]*)"$/) do |search_value|
  buffer_command(search_value)
end

Then(/^I can see the user with id "([^"]*)"$/) do |arg1|
  output = run
  expect(output).to include('id:    4')
  expect(output).to include('name:    Rose Newton')
end

