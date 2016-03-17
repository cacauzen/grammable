class User < ActiveRecord::Base
  mount_uploader :profile_picture, PictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :grams
  has_many :comments

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :profile_picture, :picture_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password, :profile_picture, :picture_cache) }
  end

  #validates_presence_of   :picture
  #validates_integrity_of  :avatar
  #validates_processing_of :avatar
end
