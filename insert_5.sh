#!/bin/sh

MONGO="/usr/bin/mongo"

echo "
use moddb;
db.mod_banners.insert({ _id: NumberLong(21), u: NumberLong(21) });
db.mod_banners.insert({ _id: NumberLong(22), u: NumberLong(22) });
db.mod_banners.insert({ _id: NumberLong(23), u: NumberLong(23) });
db.mod_banners.insert({ _id: NumberLong(24), u: NumberLong(24) });
db.mod_banners.insert({ _id: NumberLong(25), u: NumberLong(25) });
db.mod_banners.insert({ _id: NumberLong(-11), u: NumberLong(-11) });
db.mod_banners.insert({ _id: NumberLong(-12), u: NumberLong(-12) });
db.mod_banners.insert({ _id: NumberLong(-13), u: NumberLong(-13) });
" | $MONGO
