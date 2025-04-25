class PagesController < ApplicationController
  def home
  end

  def finish
    @survey = Survey.last
  end
end
