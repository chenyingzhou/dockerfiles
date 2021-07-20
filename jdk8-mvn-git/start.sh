#!/bin/bash

if [[ $GIT_URL =~ ^(git@|http://|https://)(.*)[:/](.*)/(.*)\.git$ ]]; then
  DOMAIN=${BASH_REMATCH[2]}
  AUTHOR=${BASH_REMATCH[3]}
  PROJECT=${BASH_REMATCH[4]}
else
  echo Check your git url: ${GIT_URL}
  exit 1
fi

mkdir /root/.ssh
chmod 700 /root/.ssh
if [ -f /host-ssh/id_rsa ]; then
  cp /host-ssh/id_rsa /root/.ssh/id_rsa
  chown root:root /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa
fi
ssh-keyscan ${DOMAIN} >/root/.ssh/known_hosts

cd /app
git clone ${GIT_URL} 2>/dev/null
cd ${PROJECT}
if [ -n "${CHECKOUT}" ]; then
  git checkout ${CHECKOUT} 2>/dev/null
  git pull 2>/dev.null
fi

# 若版本与上次相同则跳过编译
mkdir -p /opt/_build_versions
HEAD_VERSION=$(git rev-parse HEAD)
BUILD_VERSION=$(cat /opt/_build_versions/${PROJECT} 2>/dev/null)
if [ "${HEAD_VERSION}" != "${BUILD_VERSION}" ]; then
  mvn clean package -Dmaven.test.skip=true
  echo ${HEAD_VERSION} >/opt/_build_versions/${PROJECT}
fi

# 以最大体积的.jar文件为可执行的jar包
jar=$(find /app/${PROJECT} -type f -name '*.jar' -exec stat -c '%s %n' {} \; | sort -nr | head -1 | awk '{print $2}')
java -Dfile.encoding=UTF-8 -server ${JAVA_OPTS} -jar ${jar}