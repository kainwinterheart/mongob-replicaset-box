#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;

[ 'banners', 'phrases', 'sitelinks_sets', 'contactinfo', 'icons' ].forEach(function(el) {

    var ns = 'mod_' + el;

    db.createCollection(ns);
});

[ 'banners', 'groups', 'files' ].forEach(function(el) {

    var ns = 'mod_media_' + el;

    db.createCollection(ns);
});
" | $MONGO
