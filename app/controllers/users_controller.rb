class UsersController < ApplicationController
  layout 'offerpresentationlayout'

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    anchor_finder
    redirect_to user_path(@user, anchor: anchor_finder)
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

  def anchor_finder
    output = ""
    for i in 0..5
      if params["button#{i}".to_sym].present?
        output = "button#{i}"
      end
    end
    return output
  end
end
