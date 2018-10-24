module Api::V1
class EntriesController < ApplicationController
    # Controller Code
  swagger_controller :entries, "Entry Management"

  swagger_api :index do
    summary "Fetches all Entries"
    notes "This lists all the Entries"
  end

  swagger_api :show do
    summary "Shows one Entry"
    param :path, :id, :integer, :required, "Entry ID"
    notes "This lists details of one entry"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Entry"
    param :form, :user_id, :integer, :required, "User"
    param :form, :longitude, :string, :required, "Longitude"
    param :form, :latitude, :string, :required, "Latitude"
    param :form, :start_time, :string, :required, "Start time"
    param :form, :end_time, :string, :required, "End time"
    param :form, :notes, :string, :optional, "Notes"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Entry"
    param :path, :id, :integer, :required, "Entry Id"
    param :form, :user_id, :integer, :optional, "User"
    param :form, :longitude, :float, :optional, "Longitude"
    param :form, :latitude, :float, :optional, "Latitude"
    param :form, :start_time, :datetime, :optional, "Start time"
    param :form, :end_time, :datetime, :optional, "End time"
    param :form, :notes, :string, :optional, "Notes"
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Entry"
    param :path, :id, :integer, :required, "Entry Id"
    response :not_found
  end

  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @entries = Entry.all

    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: @entry, status: :created, location: [:v1, @entry]
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.permit(:user_id, :longitude, :latitude, :end_time, :start_time, :notes)
    end
end
