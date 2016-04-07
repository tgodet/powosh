# class ProfilesController < ApplicationController
#   def edit
#   end

#   def update
#   end

#   def show
#     @user =
#   end
# end


# class ProfilesController < ApplicationController
#   def show
#     @user = current_user
#     @profile = current_user.profile
#     @profile.profile_made
#     if @profile.profile_made == false
#       redirect_to edit_user_profile_path(@user)
#     end
#   end

#   def new
#   end

#   def create
#   end

#   def edit
#     @user = current_user
#     @profile = current_user.profile
#   end

#   def update
#     @profile = current_user.profile
#     @profile.profile_made = true
#     @profile.update(profile_params)
#     redirect_to user_profile_path
#   end

#   private

#   def profile_params
#     params.require(:profile).permit(
#       :last_name,
#       :title,
#       :net_worth,
#       :estate,
#       :town,
#       :country,
#       :stallion_owner,
#       :photo,
#       :photo_cache)

#   end
# end
