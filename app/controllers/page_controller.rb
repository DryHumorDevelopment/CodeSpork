class PageController < ApplicationController
  def main
    @info = Page.info
  end
end
