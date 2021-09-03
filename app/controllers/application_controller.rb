class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found!

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
