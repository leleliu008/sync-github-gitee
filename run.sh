#!/bin/sh

set -ex

git config --global user.name  leleliu008
git config --global user.email leleliu008@gmail.com

mkdir -p ~/.ssh

cat > ~/.ssh/config <<EOF
Host *
    StrictHostKeyChecking no
EOF

while read repo
do
    git clone --bare https://github.com/leleliu008/$repo.git
    git -C $repo.git push --mirror git@gitee.com:fpliu/$repo.git
done < github-leleliu008-repos-all.txt
