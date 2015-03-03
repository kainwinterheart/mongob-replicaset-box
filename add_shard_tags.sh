#!/bin/sh

MONGO="/usr/bin/mongo"
MIN_VALUE=0
MAX_VALUE=`perl -Mbignum -e 'print 2 ** 63 - 1'`

echo "
sh.addShardTag(\"rs0\", \"ALL\");
sh.addShardTag(\"rs1\", \"ALL\");
sh.addShardTag(\"rs2\", \"ALL\");
sh.addTagRange(\"moddb.mod_banners\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"ALL\");
sh.addTagRange(\"moddb.mod_phrases\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"ALL\");
sh.addTagRange(\"moddb.mod_sitelinks_sets\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"ALL\");
sh.addTagRange(\"moddb.mod_contactinfo\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"ALL\");
sh.addTagRange(\"moddb.mod_icons\", { u: ${MIN_VALUE} }, { u: ${MAX_VALUE} }, \"ALL\");
" | $MONGO

