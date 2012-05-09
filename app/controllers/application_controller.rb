class ApplicationController < ActionController::Base
  include SentientController
  protect_from_forgery
  respond_to :html

  protected

  def successfully_created(object)
    I18n.t :successfully_created, :name => object_human_name(object)
  end

  def successfully_updated(object)
    I18n.t :successfully_updated, :name => object_human_name(object)
  end

  def successfully_destroyed(object)
    I18n.t :successfully_destroyed, :name => object_human_name(object)
  end

  def object_human_name(object)
    object.class.to_s.underscore.humanize.downcase
  end
end
