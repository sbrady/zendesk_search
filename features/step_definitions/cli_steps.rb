Given(/^a "(user|ticket|organization)" exists with the id "([^"]*)"$/) do |type, id|
end

Given(/^I have started the app$/) do
end

Given(/^I have selected to search Zendesk$/) do
  buffer_command('1')
end

When(/^I select "([^"]*)"$/) do |search_type|
  SEARCH_TYPE_TO_OPTION={
      'users' => '1',
      'tickets' => '2'
  }
  buffer_command(SEARCH_TYPE_TO_OPTION[search_type])
end

When(/^I enter search term "([^"]*)"$/) do |search_term|
  buffer_command(search_term)
end

When(/^I enter search value "([^"]*)"$/) do |search_value|
  buffer_command(search_value)
end

Then(/^I can see the user with id "([^"]*)"$/) do |id|
  output = run
  expect(output).to include("_id:                   #{id}")
  expect(output).to include('name:         Rose Newton')
end

Then(/^I can see the ticket with id "([^"]*)"$/) do |id|
  output = run
  expect(output).to include("_id:#{id}")
  expect(output).to include('status:             pending')
end


Then(/^I can see the organization with id "([^"]*)"$/) do |id|
  output = run
  expect(output).to include("_id:                 #{id}")
  expect(output).to include('domain_names:["kage.com", "ecratic.com", "endipin.com", "zentix.com"]')
end