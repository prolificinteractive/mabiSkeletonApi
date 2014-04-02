#!/bin/bash

BASEDIR=$(dirname $0)
php $BASEDIR/genDocs.php > $BASEDIR/../mabi/autodocs/iodocs/public/data/mabiskeleton.json
HOME=$BASEDIR/../mabi/autodocs/iodocs/node_modules/.bin $BASEDIR/../mabi/autodocs/iodocs/node_modules/.bin/forever start $BASEDIR/../mabi/autodocs/iodocs/app.js
