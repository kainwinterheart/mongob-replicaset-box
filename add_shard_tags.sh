#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
[ 0, 1, 2 ].forEach(function(el) {

    var name = 'rs' + el;

    sh.addShardTag(name, 'ALL');
    sh.addShardTag(name, 'NONE');
});

[ 'banners', 'phrases', 'sitelinks_sets', 'contactinfo', 'icons' ].forEach(function(el) {

    var ns = 'moddb.mod_' + el;

    sh.addTagRange(ns, { u: MinKey }, { u: NumberLong( -1 ) }, 'ALL');
    sh.addTagRange(ns, { u: NumberLong( 1 ) }, { u: MaxKey }, 'ALL');
    sh.addTagRange(ns, { u: NumberLong( -1 ) }, { u: NumberLong( 1 ) }, 'NONE');
});
" | $MONGO

