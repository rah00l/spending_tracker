class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :account_info, :set_user

  def set_user
    Qoute.current_user = current_user unless current_user.nil?
  end

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  private

  def account_info
    account_id = params[:account_id].nil? ? Account.first.id : params[:account_id].to_i
    @account_name = Account.where(id: account_id).pluck(:name)

    @accounts = Account.order("created_at")
  end
end
