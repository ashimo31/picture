class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :image)
  end
