class AudiosController < ApplicationController
  def create
    youtubuUrl = params[:q]
    youtubeId = youtubuUrl.split("=")[1]
    youtubuCommand = "youtube-dl -f 140 -o " + "public/audios/#{youtubeId}" + ".%\\(ext\\)s \"" + youtubuUrl + "\""
    puts(youtubuCommand)
    `#{youtubuCommand}`
    redirect_to root_path
  end

  def show
    @audio = Audio.find_by_id(params[:id])
  end
end
