class UsersController < ApplicationController
  layout 'offerpresentationlayout'

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user, anchor: params[:button])
  end

  private

   def user_params
    params.require(:user).permit(
      :id,
      :first_name,
      :last_name,
      :produit,
      :email,
      :phone,
      :productphoto,
      :avatarphoto,
      :cityphoto,
      :productphotomobile,
      :lessonphoto,
      :logophoto
    )
  end

end
