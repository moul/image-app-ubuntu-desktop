DOCKER_NAMESPACE =	armbuild/
NAME =			scw-app-ubuntudesktop
VERSION =		latest
VERSION_ALIASES =	14.04 trusty
TITLE =			Ubuntu Desktop
DESCRIPTION =		Ubuntu Desktop
SOURCE_URL =		https://github.com/scaleway/image-app-ubuntudesktop


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
## Here you can add custom commands and overrides
