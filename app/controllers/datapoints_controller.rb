class DatapointsController < ApplicationController
    # Controller Code
  swagger_controller :datapoints, "Datapoint Management"

  swagger_api :index do
    summary "Fetches all Datapoints"
    notes "This lists all the Datapoints"
  end

  swagger_api :show do
    summary "Shows one Datapoint"
    param :path, :id, :integer, :required, "Datapoint ID"
    notes "This lists details of one datapoint"
    response :not_found
  end

  swagger_api :create do
    summary "Creates a new Datapoint"
    param :form, :entry_id, :integer, :required, "Entry"
    param :form, :value, :integer, :required, "Value"
    param :form, :time, :datetime, :required, "Time"
    response :not_acceptable
  end

  swagger_api :update do
    summary "Updates an existing Datapoint"
    param :path, :id, :integer, :required, "Datapoint Id"
    param :form, :entry_id, :integer, :optional, "Entry"
    param :form, :value, :integer, :optional, "Value"
    param :form, :time, :datetime, :optional, "Time"
    response :not_found
    response :not_acceptable
  end

  swagger_api :destroy do
    summary "Deletes an existing Datapoint"
    param :path, :id, :integer, :required, "Datapoint Id"
    response :not_found
  end

  before_action :set_datapoint, only: [:show, :update, :destroy]

  # GET /datapoints
  def index
    @datapoints = Datapoint.all
    render json: @datapoints
  end

  # GET /datapoints/1
  def show
    render json: @datapoint
  end

  # POST /datapoints
  def create
    @datapoint = Datapoint.new(datapoint_params)

    if @datapoint.save
      render json: @datapoint, status: :created, location: [:v1, @datapoint]
    else
      render json: @datapoint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /datapoints/1
  def update
    if @datapoint.update(datapoint_params)
      render json: @datapoint
    else
      render json: @datapoint.errors, status: :unprocessable_entity
    end
  end

  # DELETE /datapoints/1
  def destroy
    @datapoint.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datapoint
      @datapoint = Datapoint.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def datapoint_params
      params.permit(:entry_id, :value, :time)
    end
end
end