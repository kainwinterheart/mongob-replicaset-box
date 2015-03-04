#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
sh.startBalancer();
sh.enableBalancing(\"moddb.mod_banners\");
sh.enableBalancing(\"moddb.mod_phrases\");
sh.enableBalancing(\"moddb.mod_sitelinks_sets\");
sh.enableBalancing(\"moddb.mod_contactinfo\");
sh.enableBalancing(\"moddb.mod_icons\");
" | $MONGO

