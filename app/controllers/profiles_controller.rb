# Profile Controller
class ProfilesController < ApplicationController
  def profile
    redirect_to root_path unless user_signed_in?

    @male = User.male
    @female = User.female
    @profile = User.find(params[:id])
    @is_disabled = current_user.id == params[:id].to_i ? "current_user" : "different_user"
  end

  def update_profile_info
    return unless user_signed_in?

    user = User.find(current_user.id)
    update_user = user.update_attributes(first_name: params["first_name"], last_name: param["last_name"],
                                         age: params["age"], mobile_number: params["mobile_number"],
                                         plate_number: params["plate_number"], email: params["email"], gender: params["gender"])

    render json: { response: "Successfuly updated" } if update_user
  end
end
