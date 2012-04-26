class ApplicationController < ActionController::Base
  include SentientController
  protect_from_forgery
  respond_to :html
end
