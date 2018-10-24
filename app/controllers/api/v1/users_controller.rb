module Api::V1
class UsersController < ApplicationController
  # This is to tell the gem that this controller is an API
  swagger_controller :users, "Users Management"

  # Each API endpoint index, show, create, etc. has to have one of these descriptions

  # This one is for the index action. The notes param is optional but helps describe what the index endpoint does
  swagger_api :index do
    summary "Fetches all Users"
    param :query, :alphabetical, :boolean, :optional, "Order users by alphabetical"
    notes "This lists all the users"
  end

  # Show needs a param which is which user id to show.
  # The param defines that it is in the path, and that it is the User's ID
  # The response params here define what type of error responses can be returned back to the user from your API. In this case, the error responses are 404 not_found and not_acceptable.
  swagger_api :show do
    summary "Shows one User"
    param :path, :id, :integer, :required, "User ID"
    notes "This lists details of one user"
    response :not_found
    response :not_acceptable
  end

  # Create doesn't take in the user id, but rather the required fields for a user (namely first_name and last_name)
  # Instead of a path param, this uses form params and defines them as required
  swagger_api :create do
    summary "Creates a new User"
    param :form, :first_name, :string, :required, "First Name"
    param :form, :last_name, :string, :required, "Last Name"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :password, :required, "Password"
    param :form, :password_confirmation, :password, :required, "Password Confirmation"
    response :not_acceptable
  end

  # Lastly destroy is just like the rest and just takes in the param path for user id. 
  swagger_api :destroy do
    summary "Deletes an existing User"
    param :path, :id, :integer, :required, "User Id"
    response :not_found
    response :not_acceptable
  end

  # Controller Code

  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: [:v1, @user]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
end
end