class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    my_page_customers_path
  end
end
