# frozen_string_literal: true

class AdminRequestsController < ApplicationController
  before_action :set_admin_request, only: %i[ show update ]
  before_action :check_authorization

  # GET /admin_requests or /admin_requests.json
  def index
    @admin_requests = AdminRequest.all
  end

  # GET /admin_requests/1 or /admin_requests/1.json
  def show
  end

  def update
    @admin_request.update(status: admin_request_params[:status])
    if @admin_request.save
      redirect_to @admin_request
    else
      render json: @admin_request.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_request
    @admin_request = AdminRequest.find(admin_request_params[:id])
  end

  # Only allow a list of trusted parameters through.
  def admin_request_params
    params.require(:admin_request).permit(%i[ id status ])
  end

  def check_authorization
    authorize AdminRequest
  end
end
