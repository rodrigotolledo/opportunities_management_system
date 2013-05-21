require 'selenium-webdriver'
require 'rspec'
#require 'active_record'
#require File.expand_path(File.dirname(__FILE__) + "/../../app/models/user")

# Before run, make sure to delete user from database:
# 1) rails console
# 2) User.find_by_email("teste1@teste1.com").destroy

describe "OportunaSystem" do
	before(:all) do
		@driver = Selenium::WebDriver.for :firefox
		@driver.navigate.to 'http://localhost:3000'
	end

	after(:all) do
		#User.find_by_email("teste1@teste1.com").destroy
		@driver.quit
	end

	it "should be able to sign-up" do
		user_email_field = @driver.find_element(:id, 'user_email')
		user_email_field.send_keys "teste1@teste1.com"
		user_password_field = @driver.find_element(:id, 'user_password')
		user_password_field.send_keys "teste1"
		user_password_confirmation_field = @driver.find_element(:id, 'user_password_confirmation')
		user_password_confirmation_field.send_keys "teste1"
		create_user_button = @driver.find_element(:id, 'create_user_button')
		create_user_button.click
		add_new_opportunity_button = @driver.find_element(:id, 'add_new_opportunity_button')
		add_new_opportunity_button.displayed?.should be_true
	end

	it "should be able to add a new opportunity" do
		add_new_opportunity_button = @driver.find_element(:id, 'add_new_opportunity_button')
		add_new_opportunity_button.click
		code_field = @driver.find_element(:id, 'opportunity_code')
		code_field.send_keys "001"
		company_field = @driver.find_element(:id, 'opportunity_company')
		company_field.send_keys "Company 001"
		address_field = @driver.find_element(:id, 'opportunity_address') 
		address_field.send_keys "Address 123"
		salary_field = @driver.find_element(:id, 'opportunity_salary')
		salary_field.send_keys "R$ 1.000,00"
		start_date_field = @driver.find_element(:id, 'opportunity_start_date')
		start_date_field.send_keys "01/08/2013"
		end_date_field = @driver.find_element(:id, 'opportunity_end_date')
		end_date_field.send_keys "01/08/2014"
		requirements_field = @driver.find_element(:id, 'opportunity_requirements')
		requirements_field.send_keys "Web development, HTML, CSS, JavaScript..."
		add_opportunity_button = @driver.find_element(:id, 'add_opportunity_button')
		add_opportunity_button.click
		notice_message = @driver.find_element(:id, 'notice')
		notice_message.displayed?.should be_true
	end

	it "should be able to edit an opportunity" do
		edit_link = @driver.find_element(:xpath, '/html/body/table/tbody/tr[last()]/td[8]/a')
		edit_link.click
		code_field = @driver.find_element(:id, 'opportunity_code')
		code_field.send_keys "001 Edited"
		company_field = @driver.find_element(:id, 'opportunity_company')
		company_field.send_keys "Company 001 Edited"
		address_field = @driver.find_element(:id, 'opportunity_address') 
		address_field.send_keys "Address 123 Edited"
		update_opportunity_button = @driver.find_element(:id, 'update_opportunity_button') 
		update_opportunity_button.click
		notice_message = @driver.find_element(:id, 'notice')
		notice_message.displayed?.should be_true
	end

	it "should be able to delete an opportunity" do
		delete_link = @driver.find_element(:xpath, '/html/body/table/tbody/tr[last()]/td[8]/a[2]')
		delete_link.click
		alert = @driver.switch_to.alert
		alert.accept
		notice_message = @driver.find_element(:id, 'notice')
		notice_message.displayed?.should be_true
	end
end
