class UsersController < ApplicationController
  layout 'offerpresentationlayout'

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if params[:check_user_origin] ==  "boutique_button"
      redirect_to home_path
    end
    redirect_to user_path(@user)
  end

  private

   def user_params
    params.require(:user).permit(
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
