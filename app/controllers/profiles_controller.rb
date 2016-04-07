class ProfilesController < ApplicationController
  def edit

  end

  def update
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end
end


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

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :address,
      :profile_picture,
      :birth_date,
      :book_owner,
      :user_id,
      :created_at,
      :updated_at
      )
  end
end
