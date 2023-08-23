class HomeController < ApplicationController

  before_action :set_current_user
  before_action :forbid_login_user, {only: [:top]}

  def top
  end

  def about
  end

end
