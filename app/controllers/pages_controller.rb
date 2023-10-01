class PagesController < ApplicationController
  skip_before_action :require_login, only: %i[privacy_policy terms]
  
  def privacy_policy
  end

  def terms
  end
end
