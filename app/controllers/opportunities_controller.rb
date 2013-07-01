class OpportunitiesController < ApplicationController

	def index
		if student?
			@opportunities = Opportunity.where(approved: true).where("end_date >= ?", Time.zone.now.to_date)
		else
			#@opportunities = Opportunity.all
			# This return just VALID opportunities! Time format should be '2013-06-26'
			@opportunities = Opportunity.where("end_date >= ?", Time.zone.now.to_date)
		end
	end

	def new
		@opportunity = Opportunity.new
	end

	def create
		@opportunity = Opportunity.new(params[:opportunity])
		if @opportunity.save
			flash[:notice] = "Opportunity added successfully!"
			redirect_to opportunities_path
		else
			render :action => "new"
		end
	end

	def edit
		@opportunity = Opportunity.find(params[:id])
	end

	def update
    	@opportunity = Opportunity.find(params[:id])
    	if @opportunity.update_attributes(params[:opportunity])
    		flash[:notice] = "Opportunity updated successfully!"
      		redirect_to opportunities_path
    	else
    		render :action => "new"
    	end
    end

    def destroy
    	@opportunity = Opportunity.find(params[:id]).destroy
    	flash[:notice] = "Opportunity deleted successfully!"
    	redirect_to opportunities_path
    end

    def approve
    	@opportunity = Opportunity.find(params[:id])
    	@opportunity[:approved] = true
    	@opportunity.save
    	redirect_to opportunities_path
    end

    def apply_opportunity
    	@opportunity = Opportunity.find(params[:id])
    	@opportunity.users << User.find(session[:user_id]) if session[:user_id]
    	@opportunity.save
    	redirect_to opportunities_path
  	end

    def show_students
    	@opportunity = Opportunity.find(params[:id])
    	if student?
			@opportunities = Opportunity.where(approved: true).where("end_date >= ?", Time.zone.now.to_date)
		else
			@opportunities = Opportunity.where("end_date >= ?", Time.zone.now.to_date)
		end
    	render action: "index"
    end
end
