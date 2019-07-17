class WelcomeController < ApplicationController
  def index
    @menus = Menu.all
  end
end
