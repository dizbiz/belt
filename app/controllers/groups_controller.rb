class GroupsController < ApplicationController
	def index
		@group = Group.all.includes(:users)
		@user = current_user
	end
	
	def create
		group = Group.create(
			group_params.merge({
				host: current_user
				})
			)
		redirect_to '/groups'
	end
	def show
		@group = Group.find(params[:id])
		@roster = @group.group_rosters
		@groups = Group.all.includes(:group_rosters)
		@user = current_user
		
	end
	def edit
    @group = Group.find(params[:id])
	end

	def update
		group = Group.find(params[:id])
	end

	def destroy
	group = Group.find(params[:id])
	group.destroy
	redirect_to "/groups"
	end
	
	private
		def group_params
			params.require(:group).permit(:name, :description)
			
		end
end
