#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;
db.mod_banners.insert({ _id: NumberLong(1), u: NumberLong(1) });
db.mod_banners.insert({ _id: NumberLong(2), u: NumberLong(2) });
db.mod_banners.insert({ _id: NumberLong(3), u: NumberLong(3) });
db.mod_banners.insert({ _id: NumberLong(4), u: NumberLong(4) });
db.mod_banners.insert({ _id: NumberLong(5), u: NumberLong(5) });
db.mod_banners.insert({ _id: NumberLong(-1), u: NumberLong(-1) });
" | $MONGO

