require 'selenium-webdriver'
require 'rspec'
require 'active_record'
require File.expand_path(File.dirname(__FILE__) + "/../../app/models/user")

class OportunaSystem < ActiveRecord::Base
	ActiveRecord::Base.establish_connection(
		:adapter => "sqlite3",
		:database  => "db/development.sqlite3"
	)
end

describe OportunaSystem do
	before(:all) do
		@driver = Selenium::WebDriver.for :firefox
		@driver.navigate.to 'http://localhost:3000'
		@driver.manage.timeouts.implicit_wait = 5
	end

	after(:all) do
		User.find_by_email("teste1@teste1.com").destroy
		@driver.quit
	end

	it "should be able to sign-up" do
		@driver.find_element(:id, 'user_email').send_keys "teste1@teste1.com"
		@driver.find_element(:id, 'user_password').send_keys "teste1"
		@driver.find_element(:id, 'user_password_confirmation').send_keys "teste1"
		@driver.find_element(:id, 'create_user_button').click
		add_new_opportunity_button = @driver.find_element(:id, 'add_new_opportunity_button')
		add_new_opportunity_button.displayed?.should be_true
	end

	it "should be able to add a new opportunity" do
		@driver.find_element(:id, 'add_new_opportunity_button').click
		@driver.find_element(:id, 'opportunity_code').send_keys "001"
		@driver.find_element(:id, 'opportunity_company').send_keys "Company 001"
		@driver.find_element(:id, 'opportunity_address').send_keys "Address 123"
		@driver.find_element(:id, 'opportunity_salary').send_keys "R$ 1.000,00"
		@driver.find_element(:id, 'opportunity_start_date').send_keys "01/08/2013"
		@driver.find_element(:id, 'opportunity_end_date').send_keys "01/08/2014"
		@driver.find_element(:id, 'opportunity_requirements').send_keys "Web development, HTML, CSS, JavaScript..."
		@driver.find_element(:id, 'add_opportunity_button').click
		notice_message = @driver.find_element(:id, 'notice')
		notice_message.displayed?.should be_true
	end

	it "should be able to edit an opportunity" do
		@driver.find_element(:xpath, '/html/body/table/tbody/tr[last()]/td[8]/a').click
		@driver.find_element(:id, 'opportunity_code').send_keys "001 Edited"
		@driver.find_element(:id, 'opportunity_company').send_keys "Company 001 Edited"
		@driver.find_element(:id, 'opportunity_address').send_keys "Address 123 Edited"
		@driver.find_element(:id, 'update_opportunity_button').click
		notice_message = @driver.find_element(:id, 'notice')
		notice_message.displayed?.should be_true
	end

	it "should be able to delete an opportunity" do
		@driver.find_element(:xpath, '/html/body/table/tbody/tr[last()]/td[8]/a[2]').click
		alert = @driver.switch_to.alert
		alert.accept
		notice_message = @driver.find_element(:id, 'notice')
		notice_message.displayed?.should be_true
	end
end
