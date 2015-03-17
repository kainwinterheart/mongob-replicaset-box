#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
sh.addShard('rs4/testMDB7:27017');
sh.addShardTag('rs4', 'ALL');
sh.addShardTag('rs4', 'NONE');
" | $MONGO
