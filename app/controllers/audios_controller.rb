class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def create
    youtubuUrl = params[:q]
    youtubeId = youtubuUrl.split("=")[1]
    youtubuCommand = "youtube-dl -f 140 -o " + "public/audios/#{youtubeId}" + ".%\\(ext\\)s \"" + youtubuUrl + "\""
    puts(youtubuCommand)
    `#{youtubuCommand}`
    # @audio = Audio.new(youtubeId+".m4a", youtubuUrl)
    @audio = Audio.new()
    @audio.filename = youtubeId+".m4a"
    @audio.url = youtubuUrl
    @audio.title = youtubeId
    @audio.save

    redirect_to root_path
  end


  def destroy
    @audio = Audio.find(params[:id])
    @audio.destroy

    redirect_to audios_path
  end

  def show
    @audio = Audio.find_by_id(params[:id])
  end

end
