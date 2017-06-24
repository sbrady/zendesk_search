Given(/^a "(user|ticket|organization)" exists with the id "([^"]*)"$/) do |type, id|
end

Given(/^I have started the app$/) do
end

Given(/^I have selected to search Zendesk$/) do
  buffer_command('1')
end

When(/^I select to search view list of searchable fields$/) do
  buffer_command('2')
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


Then(/^I can see the list of user fields$/) do
  output = run
user_fields =  <<USER_FIELD
Search User With:
_id
url
external_id
name
USER_FIELD
  expect(output). to include(user_fields)
end

Then(/^I can see the list of ticket fields$/) do
  output = run
  ticket_fields =  <<TICKET_FIELD
Search Ticket With:
_id
url
external_id
created_at
type
TICKET_FIELD
  expect(output). to include(ticket_fields)
end

Then(/^I can see the list of organization fields$/) do
  output = run
  org_fields =  <<ORG_FIELD
Search Organization With:
_id
url
external_id
name
domain_names
ORG_FIELD
  expect(output). to include(org_fields)

end