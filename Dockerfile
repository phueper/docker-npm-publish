FROM node:6

MAINTAINER phueper@hueper.net

# hm... do we need an extra dockerfile? all i really want is a common WORKDIR,
# which doesn't seem possible from docker-compose file
WORKDIR /opt/work
# this is just for convenience... and to make it "harder" to run anything but npm commands in the container :)
ENTRYPOINT npm