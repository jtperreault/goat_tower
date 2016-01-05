class ApplicationController < ActionController::API
  before_action :verify_handle_present

  private

  def verify_handle_present
    unless(params[:player].present? && params[:player][:handle].present?)
      render json: {error: {message: 'Malformed request. You must include player handle data.'}}, status: 400
    end
  end
end
