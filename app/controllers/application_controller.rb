class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found!
end
