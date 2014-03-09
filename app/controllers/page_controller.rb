class PageController < ApplicationController
  before_filter :authenticate_user!
  def main
    @info = Page.info
  end
end
