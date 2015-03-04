#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use admin;
sh.addShard(\"rs3/testMDB6:27017\");
sh.addShardTag(\"rs3\", \"NONE\");
sh.addTagRange(\"moddb.mod_banners\", { u: 0 }, { u: 0 }, \"NONE\");
sh.addTagRange(\"moddb.mod_phrases\", { u: 0 }, { u: 0 }, \"NONE\");
sh.addTagRange(\"moddb.mod_sitelinks_sets\", { u: 0 }, { u: 0 }, \"NONE\");
sh.addTagRange(\"moddb.mod_contactinfo\", { u: 0 }, { u: 0 }, \"NONE\");
sh.addTagRange(\"moddb.mod_icons\", { u: 0 }, { u: 0 }, \"NONE\");
db.runCommand({ movePrimary: \"moddb\", to: \"rs3\" });
db.runCommand({ flushRouterConfig: 1 });
" | $MONGO

