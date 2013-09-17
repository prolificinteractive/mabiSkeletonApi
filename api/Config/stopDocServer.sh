#!/bin/bash

BASEDIR=$(dirname $0)
HOME=$BASEDIR/../../mabi/autodocs/iodocs/node_modules/.bin $BASEDIR/../../mabi/autodocs/iodocs/node_modules/.bin/forever stopall
