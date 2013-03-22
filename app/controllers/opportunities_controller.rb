class OpportunitiesController < ApplicationController

	def index
		@opportunities = Opportunity.all
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
end
