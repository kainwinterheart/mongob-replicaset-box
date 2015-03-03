#!/bin/sh

MONGO="/usr/bin/mongo"
MIN_VALUE=`perl -Mbignum -e 'print -2 ** 63'`
MAX_VALUE=-1

echo "
use admin;
sh.addShard(\"rs3/testMDB6:27017\");
sh.addShardTag(\"rs3\", \"NONE\");
sh.addTagRange(\"moddb.mod_banners\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"NONE\");
sh.addTagRange(\"moddb.mod_phrases\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"NONE\");
sh.addTagRange(\"moddb.mod_sitelinks_sets\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"NONE\");
sh.addTagRange(\"moddb.mod_contactinfo\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"NONE\");
sh.addTagRange(\"moddb.mod_icons\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"NONE\");
db.runCommand({ movePrimary: \"moddb\", to: \"rs3\" });
db.runCommand({ flushRouterConfig: 1 });
" | $MONGO

