from flask import Flask, render_template, request, redirect, jsonify, url_for, flash
import subprocess
import os

def download(urlStr, filename):
    command = "cd ~/Downloads/ \n"
    youtubeDownload = "youtube-dl -f 140 -o " + filename + ".%\(ext\)s " + urlStr
    command += youtubeDownload
    subprocess.call(command, shell=True)

app = Flask(__name__)

@app.route('/')
def index():
    print os.getcwd()
    return render_template("index.html")

@app.route('/download', methods=['POST'])
def downloadAudio():
    currentPath = os.getcwd()
    command = "cd " + currentPath + "/static/audios \n"
    urlStr = request.form['youtubeUrl']
    vedioId = urlStr[(urlStr.index('=')+1):]
    # youtubeDownload = "youtube-dl -f 140 -o " + "%\(id\)s.%\(ext\)s " + urlStr
    youtubeDownload = "youtube-dl -f 140 -o " + vedioId + ".%\(ext\)s " + urlStr
    command += youtubeDownload
    child = subprocess.Popen(command, shell=True)
    child.wait()
    print "done"
    return redirect(url_for('showAudioPlayer', audioId=vedioId))

@app.route('/audio/<path:audioId>')
def showAudioPlayer(audioId):
    audiofile = 'audios/' + audioId + '.m4a'
    return render_template('AudioPlayer.html', audiofile=audiofile)



if __name__ == '__main__':
    app.secret_key = 'super_secret_key'
    app.debug = True
    app.run(host='0.0.0.0', port=8080)