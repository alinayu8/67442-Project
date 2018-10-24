class UsersController < ApplicationController
    # Controller Code
  swagger_controller :users, "User Management"

  swagger_api :index do
    summary "Fetches all Users"
    notes "This lists all the users"
  end

  swagger_api :show do
    summary "Shows one User"
    param :path, :id, :integer, :required, "User ID"
    notes "This lists details of one user"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new User"
    param :form, :first_name, :string, :required, "First name"
    param :form, :last_name, :string, :required, "Last name"
    param :form, :email, :string, :required, "Email"
    param :form, :password_digest, :string, :required, "Password"
    param :form, :token, :string, :optional, "Token"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing User"
    param :path, :id, :integer, :required, "User Id"
    param :form, :last_name, :string, :optional, "Last name"
    param :form, :email, :string, :optional, "Email"
    param :form, :password_digest, :string, :optional, "Password"
    param :form, :token, :string, :optional, "Token"
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing User"
    param :path, :id, :integer, :required, "User Id"
    response :not_found
  end

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
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
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
      params.permit(:email, :password_digest, :token, :first_name, :last_name)
    end
end
