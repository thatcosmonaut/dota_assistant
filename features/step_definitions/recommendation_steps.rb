Given(/^the seeds$/) do
  require "rake"
  @rake = Rake::Application.new
  Rake.application = @rake
  Rake.application.rake_require "tasks/seed"
  Rake::Task.define_task(:environment)
  @rake['db:populate'].invoke
end

When(/^I go to the hero picker page$/) do
  visit root_path
end

When(/^I type (.*) into the friendly hero select$/) do |hero_name|
  fill_autocomplete('friendly-autocomplete', 'Add a character...', with: hero_name)
end

When(/^I type (.*?) into the enemy hero select$/) do |hero_name|
  fill_autocomplete('enemy-autocomplete', 'Add enemy hero...', with: hero_name)
end

When(/^I type (.*?) into the ban select$/) do |hero_name|
  fill_autocomplete('ban-autocomplete', 'Add banned hero...', with: hero_name)
end

When(/^I click on the first recommendation$/) do
  find('.recommend-these').first('.recommendation').click
end

When(/^I click on the first member of my team$/) do
  find('.your-team .characters.cf').first('.friendly').click
end

When(/^I click on the first ban recommendation$/) do
  find('.ban-these').first('.ban').click
end

Then(/^I should be taken to the recommendation screen$/) do
  expect(current_path).to eq(pick_assistant_path)
end

Then(/^I should see 5 best pick recommendations$/) do
  expect(page.find('.recommend-these').all('.name').select { |elt| elt.text.empty? }).to eql []
end

Then(/^I should see 5 worst pick recommendations$/) do
  expect(page.find('.avoid-these').all('.name').select { |elt| elt.text.empty? }).to eql []
end

Then(/^I should see that hero on my team list$/) do
  expect(page.find('.your-team .characters.cf').all('.name').reject { |elt| elt.text.empty? }.length).to eql 2
end

Then(/^I should see needed roles$/) do
  expect(page.find('.roles').find('.needed').all('.needed-role').select { |elt| elt.text == 'Needed' }).to eql []
end

Then(/^I should see filled roles$/) do
  expect(page.find('.roles').find('.filled').all('.filled-role').select { |elt| elt.text == 'Filled' }).to eql []
end

Then(/^that box should become blank$/) do
  expect(page.find('.your-team .characters.cf').first('.friendly').find('.name').text).to eql ''
end

Then(/^I should see 5 ban recommendations$/) do
  expect(page.find('.ban-these').all('.name').select { |elt| elt.text.empty? }).to eql []
end

Then(/^I should see (.*) in the first box for my team$/) do |hero_name|
  expect(page.find('.your-team .characters.cf').first('.name').text).to eql hero_name
end

Then(/^I should see (.*) on the enemy team list$/) do |hero_name|
  expect(page.find('.enemy-team .characters.cf').first('.name').text).to eql hero_name
end

Then(/^I should see (.*) on the ban list$/) do |hero_name|
  expect(page.find('.bans.characters.cf').first('.name').text).to eql hero_name
end

Then(/^there should be another hero on the ban list$/) do
  expect(page.find('.bans.characters.cf').all('.name').reject { |elt| elt.text.empty? }.length).to eql 2
end
