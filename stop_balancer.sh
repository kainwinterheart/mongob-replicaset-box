#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
sh.disableBalancing(\"moddb.mod_banners\");
sh.disableBalancing(\"moddb.mod_phrases\");
sh.disableBalancing(\"moddb.mod_sitelinks_sets\");
sh.disableBalancing(\"moddb.mod_contactinfo\");
sh.disableBalancing(\"moddb.mod_icons\");
sh.stopBalancer(1,1);
" | $MONGO

