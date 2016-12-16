class HomeController < ApplicationController

  def homepage
    @trips = Trip.order(created_at: :desc).limit(16)


  end

  def about
  end
  # def about
  # end

end
