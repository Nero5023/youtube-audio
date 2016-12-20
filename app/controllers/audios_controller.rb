class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def create
    youtubuUrl = params[:q]
    youtubeId = youtubuUrl.split("=")[1]
    youtubuCommand = "youtube-dl -f 140 -o " + "public/videos/#{youtubeId}" + ".%\\(ext\\)s \"" + youtubuUrl + "\""
    puts(youtubuCommand)
    `#{youtubuCommand}`
    redirect_to root_path
  end
end
