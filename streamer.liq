#!/usr/bin/liquidsoap
# Log dir
set("log.file.path","/tmp/basic-radio.log")

# alsa
# in = fallback([input.external("/usr/local/bin/pianobar"), single("/home/aziz/Music/blind_willie.mp3")])
# in = mksafe(input.external("pianobar"))
in = mksafe(input.external("gnome-terminal --tab -e \"pianobar\""))
# Stream it out
output.icecast(%vorbis, host = "localhost", port = 8000, password = "hackme", mount = "stream", in)
