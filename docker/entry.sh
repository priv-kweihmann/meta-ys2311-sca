#!/bin/sh
# SPDX-FileCopyrightText: (C) 2023 Avnet Embedded GmbH
# SPDX-License-Identifier: GPL-3.0-only

# Fix default uid/gid to 1000
uid=${uid:-1000}
gid=${gid:-1000}
user=user
group=$user
home=/home/${user}

# Add docker host SSH key in know hosts, so gits hosted on host can be used for
# development
host_ip=$(/sbin/ip route | awk '/default/ { print $3 }')
ssh-keyscan -T 1 "${host_ip}" >> /etc/ssh/ssh_known_hosts 2> /dev/null

# Set default command to bash that reads ~/.profile
if [ "$#" = 0 ]; then
    set -- /bin/bash -l
fi

if [ "${uid}" = 0 ]; then
  set -a
  # shellcheck disable=SC1091
  . "/opt/sdk/environment-setup-*"
  set +a
  exec "${@}"
else
  groupmod --gid "${gid}" "${group}" >/dev/null
  usermod --uid "${uid}" --gid "${gid}" "${user}" >/dev/null

  if [ -n "${kvm_gid}" ]; then
      groupadd --gid "${kvm_gid}" "kvm"
      gpasswd -a "${user}" kvm > /dev/null
  fi

  chown ${user}:${group} ${home}

  # Switch to the user we just added and run the given command or /bin/sh
  cd /home/user/src || exit 1
  exec gosu ${user} "${@}"
fi
