class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    if User.exists?(params[:id])
      respond_with User.find(params[:id])
    else
      error_show
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      respond_with user
    else
      error_create(user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :social_security_number)
    end

    def error_show
      render status: 404, json: {
        message: "no user"
      }
    end

    def error_create(user)
      render status: 400, json: {
        message: user.errors.full_messages.join(", ")
      }
    end
end
