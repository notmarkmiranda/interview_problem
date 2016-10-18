class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_with @user
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :social_security_number)
    end
end
