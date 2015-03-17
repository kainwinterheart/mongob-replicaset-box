#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;
db.mod_banners.insert({ _id: NumberLong(16), u: NumberLong(16) });
db.mod_banners.insert({ _id: NumberLong(17), u: NumberLong(17) });
db.mod_banners.insert({ _id: NumberLong(18), u: NumberLong(18) });
db.mod_banners.insert({ _id: NumberLong(19), u: NumberLong(19) });
db.mod_banners.insert({ _id: NumberLong(20), u: NumberLong(20) });
db.mod_banners.insert({ _id: NumberLong(-8), u: NumberLong(-8) });
db.mod_banners.insert({ _id: NumberLong(-9), u: NumberLong(-9) });
db.mod_banners.insert({ _id: NumberLong(-10), u: NumberLong(-10) });
" | $MONGO
