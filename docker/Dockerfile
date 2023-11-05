# SPDX-FileCopyrightText: (C) 2023 Avnet Embedded GmbH
# SPDX-License-Identifier: GPL-3.0-only

FROM ubuntu:20.04



ENV DEBIAN_FRONTEND=noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV user user
ENV group ${user}
ENV HOME /home/${user}
ENV uid 1000
ENV gid 1000

ARG SDKINSTALLER=sdk.sh
ARG ENTRY="entry.sh"

RUN apt-get update \
	&& apt-get install -y ca-certificates \
	&& update-ca-certificates \
	&& apt-get -y install \
	bash-completion \
	iproute2 \
	bc \
	bison \
	build-essential \
	chrpath \
	cpio \
	curl \
	debianutils \
	diffstat \
	gawk \
	git \
	git-lfs \
	gosu \
	locales \
	locales-all \
	lz4 \
	mesa-common-dev \
	nano \
	ncurses-term \
	pylint3 \
	python-is-python3 \
	python3 \
	python3-dev \
	python3-gi \
	python3-git \
	python3-jinja2 \
	python3-pexpect \
	python3-pip \
	python3-subunit \
	python3-yaml \
	rpm \
	rsync \
	screen \
	socat \
	sudo \
	texinfo \
	unzip \
	vim \
	wget \
	xz-utils \
	zip \
	zstd \
  # Cleaning up apt
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  # Set the correct locales for Yocto build
  && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
  && locale-gen \
  # For the user
  && mkdir -p ${HOME} \
  # Allow scotty user to use sudo without password
  && echo "user ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers \
  # Make sure all home files are owned by user uid
  && chown -R "${uid}:${gid}" ${HOME}

COPY --chmod=755 $SDKINSTALLER /sdk.sh

RUN /sdk.sh -y -d /opt/sdk \
	&& rm /sdk.sh

# Change the entry point to the adduser script
COPY --chmod=555 ${ENTRY} /

# Init sdk at every run in profile
RUN groupadd --gid "${gid}" "${group}" && \
	useradd --home-dir /home/${user} --uid "${uid}" --gid "${gid}" "${user}" && \
	chown -R ${user}:${group} /home/${user} && \
	echo . /opt/sdk/environment-setup-* >/home/${user}/.profile

ENV ENTRYPOINT="/${ENTRY}"
ENTRYPOINT $ENTRYPOINT
