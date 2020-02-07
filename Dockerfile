# stable release
FROM miniitlabs/openjdk8-maven3

RUN apt-get update -y && apt-get -y install firefox libasound2 libgtk2.0-0 xvfb bzip2 libdbus-glib-1-2

ADD https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/34.0.5/linux-x86_64/en-US/firefox-34.0.5.tar.bz2 /tmp/

RUN tar -xvjf /tmp/firefox-34.0.5.tar.bz2 -C /opt/ && chmod +x /opt/firefox/firefox
RUN rm -Rf /usr/bin/firefox && ln -s /opt/firefox/firefox /usr/bin/firefox

CMD xvfb-run --server-args=":99.0 -screen 0 2000x2000x16 -ac" "firefox"
