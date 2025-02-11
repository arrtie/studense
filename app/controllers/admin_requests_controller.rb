class AdminRequestsController < ApplicationController
  before_action :set_admin_request, only: %i[ show update ]
  before_action :check_authorization

  # GET /admin_requests or /admin_requests.json
  def index
    @admin_requests = AdminRequest.all
  end

  # GET /admin_requests/1 or /admin_requests/1.json
  def show
    @admin_request = AdminRequest.find(params[:id])
  end

  def update
    @admin_request.update(status: admin_request_params[:status])
    if @admin_request.save
      redirect_to @admin_request
    else
      redirect_to :back, alert: "malformed request"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_request
    @admin_request = AdminRequest.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def admin_request_params
    params.fetch(:admin_request, [ :id, :status ])
  end

  def check_authorization
    authorize AdminRequest
  end
end
