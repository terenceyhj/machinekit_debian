#!/bin/bash -ex

branch="${TAG}/${CMD}"
if [ ! -z ${FLAV+x} ]; then
    branch+="/${FLAV}"
fi

# only upload if ssh key is present
if [ -f ~/.ssh/id_rsa ]; then
    cd ${TRAVIS_BUILD_DIR}/../ccache
    git init
    git add -A
    git config --global user.email "wilson_xiao90@163.com"
    git config --global user.name "wilsonxiao"
    git commit -m ccache 2>&1 >/dev/null
    git remote add origin git@github.com:wilsonxiao/machinekit_debian
    git checkout -b ${branch}
    git push --set-upstream origin ${branch} --force || true
fi
