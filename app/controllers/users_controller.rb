class UsersController < ApplicationController
  layout 'offerpresentationlayout'
  skip_before_action :authenticate_user!, only: [:subscribe]

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    anchor_finder
    redirect_to user_path(@user, anchor: anchor_finder)
  end

  def subscribe
    if Regexp.new('\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z').match(params[:user][:email]) && params[:user][:first_name] != "" && params[:user][:tracking] != ""
      @user = User.user_subscribe(user_params)
      session[:email] ? session[:email] += 1 : session[:email] = 1
      if session[:email] < 10
        SignupMailer.web_message(@user, @admin).deliver_now
        flash[:notice] = t(:message_thank)
      else
        flash[:alert] = "Vous avez envoyé un trop grand nombre de messages"
      end
    else
      flash[:alert] = t(:incorrect_fields)
    end
    redirect_to request.referrer
  end

  private

   def user_params
    params.require(:user).permit(
      :id,
      :first_name,
      :last_name,
      :email,
      :produit,
      :phone,
      :adress,
      :zip_code,
      :city,
      :provider,
      :tracking,
      :uid,
      :facebook_picture_url,
      :token,
      :token_expiry,
      :productphoto,
      :avatarphoto,
      :cityphoto,
      :productphotomobile,
      :lessonphoto,
      :logophoto,
      :darktheme1photo,
      :darktheme2photo,
      :darktheme3photo,
      :darktheme4photo,
      :country,
      homerightphotos: []
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
