#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;
db.mod_banners.insert({ _id: NumberLong(6), u: NumberLong(6) });
db.mod_banners.insert({ _id: NumberLong(7), u: NumberLong(7) });
db.mod_banners.insert({ _id: NumberLong(8), u: NumberLong(8) });
db.mod_banners.insert({ _id: NumberLong(9), u: NumberLong(9) });
db.mod_banners.insert({ _id: NumberLong(10), u: NumberLong(10) });
db.mod_banners.insert({ _id: NumberLong(-2), u: NumberLong(-2) });
db.mod_banners.insert({ _id: NumberLong(-3), u: NumberLong(-3) });
db.mod_banners.insert({ _id: NumberLong(-4), u: NumberLong(-4) });
" | $MONGO

