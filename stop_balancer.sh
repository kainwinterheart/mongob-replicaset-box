#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
sh.disableBalancing(\"moddb.mod_banners\");
sh.disableBalancing(\"moddb.mod_phrases\");
sh.disableBalancing(\"moddb.mod_sitelinks_sets\");
sh.disableBalancing(\"moddb.mod_contactinfo\");
sh.disableBalancing(\"moddb.mod_icons\");
sh.disableBalancing(\"moddb.mod_media_banners\");
sh.disableBalancing(\"moddb.mod_media_groups\");
sh.disableBalancing(\"moddb.mod_media_files\");
sh.stopBalancer(1,1);
" | $MONGO
