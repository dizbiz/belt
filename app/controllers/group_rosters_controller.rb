class GroupRostersController < ApplicationController
	def create
		GroupRoster.create(
			group: Group.find(params[:id]),
			user: current_user
			)
		redirect_to '/groups'
	end

	def destroy
		GroupRoster.find_by(
			group: Group.find(params[:id]),
			user: current_user
			).destroy
		redirect_to '/groups'
	end
		
	

end
