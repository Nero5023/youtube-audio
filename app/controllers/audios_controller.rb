require 'yt'

class AudiosController < ApplicationController
  def index
    @audios = Audio.all
  end

  def create
    # youtubuUrl = params[:q]
    # youtubeId = youtubuUrl.split("=")[1]
    # https://www.youtube.com/watch?v=
    youtubeId =  params[:vedio_id]
    youtubuUrl = "https://www.youtube.com/watch?v=" + youtubeId
    youtubuCommand = "youtube-dl -f 140 -o public/audios/#{youtubeId}.%\\(ext\\)s \"#{youtubuUrl}\" -4"
    # youtubuCommand = "youtube-dl -f 140 -o public/audios/#{youtubeId}.%\\(ext\\)s \"#{youtubuUrl}\" --proxy \"http://127.0.0.1:8123\" "

    if(Audio.find_by_url(youtubuUrl))
      redirect_to Audio.find_by_url(youtubuUrl)
    else
      puts(youtubuCommand)
      `#{youtubuCommand}`
      @audio = Audio.new()
      @audio.filename = youtubeId+".m4a"
      @audio.url = youtubuUrl
      @audio.title = params[:title]
      @audio.thumbnail_url = params[:thumbnail_url]
      @audio.duration = params[:duration]
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
    # Yt.configuration.api_key = 'AIzaSyAWIKMkixMDQxZtJVkAVxddzgkIjQPvkIM'
    # videos = Yt::Collections::Videos.new
    # puts(videos.where(order: 'viewCount').first.title)
    @audio = Audio.find_by_id(params[:id])
  end

end
