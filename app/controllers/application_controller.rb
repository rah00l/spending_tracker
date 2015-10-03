class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :account_info

  private

  def account_info
    account_id = params[:account_id].nil? ? Account.first.id : params[:account_id].to_i
    @account_name = Account.where(id: account_id).pluck(:name)

    @accounts = Account.order("created_at")
  end
end
