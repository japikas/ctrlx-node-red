#!/bin/sh

CONFIG_PATH=$SNAP_DATA/solutions/activeConfiguration/node-red

if [ ! -d CONFIG_PATH ]
then
    mkdir $CONFIG_PATH
fi

set -e
if [ -z "$PORT" ]; then PORT=1880; fi
export PORT
if [ ! -f $CONFIG_PATH/settings.js ]; then
#    if [ -f $SNAP_USER_DATA/settings.js ]; then
#        echo "MIGRATE - Move settings.js to "$SNAP_DATA
#        mv $SNAP_USER_DATA/* $SNAP_USER_DATA/.config* $SNAP_DATA/
#    else
        echo "NEW - Copy settings.js to "$CONFIG_PATH
        cp $SNAP/lib/node_modules/node-red/settings.js $CONFIG_PATH/
#    fi
fi
echo NOW STARTING NODE-RED : $SNAP/bin/node-red -u $SNAP_DATA on port $PORT
"$SNAP"/bin/node "$SNAP"/lib/node_modules/.bin/node-red -u "$CONFIG_PATH" "$CONFIG_PATH/flows.json"
