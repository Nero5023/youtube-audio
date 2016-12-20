class AudiosController < ApplicationController
  def create
    youtubuUrl = params[:q]
    youtubuCommand = "youtube-dl -f 140 \"" + youtubuUrl + "\""
    `#{youtubuCommand}`
    redirect_to root_path
  end
end
