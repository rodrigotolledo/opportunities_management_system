require 'test_helper'

class OpportunityTest < ActiveSupport::TestCase

 # fixtures :Oportunity

 test "opportunity is saved successfully" do	
 	@opportunity_unitTest = Opportunity.new :code => '001',
 	:company => 'Company 001',
 	:address => 'Address 001',
 	:salary => '1000',
 	:start_date => '04-08-2013', 
 	:end_date	=> '04-08-2014',
 	:requirements => 'Computers'
 	assert @opportunity_unitTest.save
 end

 test "opportunity is copied successfully" do
 	@opportunity_unitTest = Opportunity.new :code => '001',
 	:company => 'Company 001',
 	:address => 'Address 001',
 	:salary => '1000',
 	:start_date => '04-08-2013', 
 	:end_date	=> '04-08-2014',
 	:requirements => 'Computers'
 	assert @opportunity_unitTest.save
 	opportunity_unitTest_copy = Opportunity.find(@opportunity_unitTest.id)
 	assert_equal @opportunity_unitTest, opportunity_unitTest_copy
 end

 test "opportunity is updated successfully" do
 	@opportunity_unitTest = Opportunity.new :code => '001',
 	:company => 'Company 001',
 	:address => 'Address 001',
 	:salary => '1000',
 	:start_date => '04-08-2013', 
 	:end_date	=> '04-08-2014',
 	:requirements => 'Computers'
 	assert @opportunity_unitTest.save
 	first_company = Opportunity.find(@opportunity_unitTest.id).company
 	@opportunity_unitTest.company = 'Company XYZ'
 	assert @opportunity_unitTest.save
 	assert_not_equal Opportunity.find(@opportunity_unitTest.id).company, first_company
 end

 test "opportunity is deleted successfully" do
 	@opportunity_unitTest = Opportunity.new :code => '001',
 	:company => 'Company 001',
 	:address => 'Address 001',
 	:salary => '1000',
 	:start_date => '04-08-2013', 
 	:end_date	=> '04-08-2014',
 	:requirements => 'Computers'
 	assert @opportunity_unitTest.save
 	assert Opportunity.find(@opportunity_unitTest.id).destroy
 end
end
