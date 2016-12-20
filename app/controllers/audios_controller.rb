class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def create
    youtubuUrl = params[:q]
    youtubeId = youtubuUrl.split("=")[1]
    youtubuCommand = "youtube-dl -f 140 -o public/audios/#{youtubeId}.%\\(ext\\)s \"#{youtubuUrl}\""
    # youtubuCommand = "youtube-dl -f 140 -o public/audios/#{youtubeId}.%\\(ext\\)s \"#{youtubuUrl}\" --proxy \"http://127.0.0.1:8123\" "

    if(Audio.find_by_url(youtubuUrl))
      redirect_to Audio.find_by_url(youtubuUrl)
    else
      puts(youtubuCommand)
      `#{youtubuCommand}`
      @audio = Audio.new()
      @audio.filename = youtubeId+".m4a"
      @audio.url = youtubuUrl
      @audio.title = youtubeId
      @audio.save
      redirect_to @audio
    end

  end


  def destroy
    @audio = Audio.find(params[:id])
    filename = @audio.filename
    `rm public/audios/#{filename}`
    @audio.destroy

    redirect_to audios_path
  end

  def show
    @audio = Audio.find_by_id(params[:id])
  end

end
