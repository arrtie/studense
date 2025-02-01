# frozen_string_literal: true

class AccountsController < ApplicationController
  allow_unauthenticated_access only: %i[create new]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
    @account.build_profile
  end

  def show
    @account = Account.find(params[:id])
    @profile = @account.profile
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to @account
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation, profile_attributes: [ :first_name, :last_name, :birthdate ])
  end
end
