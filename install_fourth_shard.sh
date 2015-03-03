#!/bin/sh

for shard_name in "sh0-master" "sh1-master" "sh2-master" "configserver" "mongos"
do
    vagrant up "${shard_name}" || exit 1
done

vagrant provision "mongos" &&

vagrant ssh "mongos" -c '/vagrant/add_shard_tags.sh' &&

vagrant up "sh3-master" &&

vagrant ssh "mongos" -c '/vagrant/add_fourth_shard.sh' &&

exit 0;

