#!/bin/sh

LOGROOT="./logs/"
mkdir -p "${LOGROOT}"
LOG="${LOGROOT}/install_fourth_shard.log"
echo -n "" > ${LOG}

for shard_name in "sh0-master" "sh1-master" "sh2-master" "configserver" "mongos"
do
    echo "vagrant up ${shard_name}" >> ${LOG}
    vagrant up "${shard_name}" || exit 1
done

vagrant ssh "mongos" -c '
/vagrant/stop_balancer.sh ;
/vagrant/insert_1.sh ;
/vagrant/create_unsharded_collections.sh ;
/vagrant/add_shard_tags.sh ;
' >> ${LOG} &&

for shard_name in "sh0-master" "sh1-master" "sh2-master"
do
    echo "===> ${shard_name} <===" >> ${LOG}
    vagrant ssh "${shard_name}" -c '
/vagrant/select.sh ;
' >> ${LOG} || exit 1
done

echo "vagrant up sh3-master" >> ${LOG}
vagrant up "sh3-master" &&

sleep 10 &&

vagrant ssh "mongos" -c '
/vagrant/add_fourth_shard.sh ;
/vagrant/insert_2.sh ;
' >> ${LOG} &&

vagrant ssh "sh3-master" -c '
/vagrant/create_collections.sh ;
' >> ${LOG} || exit 1

for shard_name in "sh0-master" "sh1-master" "sh2-master" "sh3-master"
do
    echo "===> ${shard_name} <===" >> ${LOG}
    vagrant ssh "${shard_name}" -c '
/vagrant/select.sh ;
' >> ${LOG} || exit 1
done

# echo "start & stop balancer" >> ${LOG}
# 
# vagrant ssh "mongos" -c '
# /vagrant/start_balancer.sh ;
# ' >> ${LOG} &&
# 
# sleep 60 &&
# 
# vagrant ssh "mongos" -c '
# /vagrant/stop_balancer.sh ;
# ' >> ${LOG} &&

vagrant ssh "mongos" -c '
/vagrant/insert_3.sh ;
' >> ${LOG} || exit 1

for shard_name in "sh0-master" "sh1-master" "sh2-master" "sh3-master"
do
    echo "===> ${shard_name} <===" >> ${LOG}
    vagrant ssh "${shard_name}" -c '
/vagrant/select.sh ;
' >> ${LOG} || exit 1
done

exit 0;

