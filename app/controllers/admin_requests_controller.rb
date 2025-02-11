class AdminRequestsController < ApplicationController
  before_action :set_admin_request, only: %i[ show ]
  before_action :check_authorization

  # GET /admin_requests or /admin_requests.json
  def index
    @admin_requests = AdminRequest.all
  end

  # GET /admin_requests/1 or /admin_requests/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_request
    @admin_request = AdminRequest.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def admin_request_params
    params.fetch(:admin_request, {})
  end

  def check_authorization
    authorize AdminRequest
  end
end
