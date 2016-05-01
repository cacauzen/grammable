class ProfileController < ApplicationController
  before_action :authenticate_user!

	def show
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?
	end

  private

  def gram_params
    params.require(:gram).permit(:message, :picture, :id)
  end

  def user_params
    params.require(:user).permit(:first_name, :id)
  end

end
