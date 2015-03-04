#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use admin;
sh.addShard('rs3/testMDB6:27017');
sh.addShardTag('rs3', 'NONE');
db.runCommand({ movePrimary: 'moddb', to: 'rs3' });
db.runCommand({ flushRouterConfig: 1 });
" | $MONGO

