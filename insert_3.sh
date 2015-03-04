#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;
db.mod_banners.insert({ _id: NumberLong(11), u: NumberLong(11) });
db.mod_banners.insert({ _id: NumberLong(12), u: NumberLong(12) });
db.mod_banners.insert({ _id: NumberLong(13), u: NumberLong(13) });
db.mod_banners.insert({ _id: NumberLong(14), u: NumberLong(14) });
db.mod_banners.insert({ _id: NumberLong(15), u: NumberLong(15) });
db.mod_banners.insert({ _id: NumberLong(-5), u: NumberLong(-5) });
db.mod_banners.insert({ _id: NumberLong(-6), u: NumberLong(-6) });
db.mod_banners.insert({ _id: NumberLong(-7), u: NumberLong(-7) });
" | $MONGO

