#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;

[ 'banners', 'phrases', 'sitelinks_sets', 'contactinfo', 'icons' ].forEach(function(el) {

    var ns = 'mod_' + el;

    db.createCollection(ns);
});
" | $MONGO

