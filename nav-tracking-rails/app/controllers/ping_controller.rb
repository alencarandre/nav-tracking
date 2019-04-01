class PingController < ApplicationController
  def index
    render plain: "pong", layout: false
  end
end
