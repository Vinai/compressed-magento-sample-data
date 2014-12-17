#!/bin/bash

#
# This script replaces files with an .mp3 ending in the specified archive and
# then builds new tgz, tbz and 7z archives from the remains.
#
# It is intended to be used with the result tgz of
# the compress-sample-data.sh script.
#
# Use at your own risk!
#
# (c) 2014 Vinai Kopp <vinai@netzarbeiter.com>
#

if [ -z "$1" ]; then
    echo "No sample data specified"
    exit 2
fi

SOURCE_ARCHIVE="$(grealpath "$1")"
[ ! -e "$SOURCE_ARCHIVE" ] && {
    echo -e "Usage:\n$0 compressed-magento-sample-data-1.x.x.x.tar.bz2"
    exit 2
}

echo "Using sample data $SOURCE_ARCHIVE"

EXCLUDE_FILES='\._*'
SAMPLE_DATA_DIR=$(tar -tvzf "$SOURCE_ARCHIVE" | head -1 | awk '{ print $9 }' | xargs basename)
WORK_DIR="./tmp-work-dir"

echo "Creating temporary working dir $WORK_DIR"
mkdir "$WORK_DIR" && cd "$WORK_DIR"
echo "Extracting sample data..."
tar -xzf "$SOURCE_ARCHIVE"

echo "Removing MP3 files"
find "$SAMPLE_DATA_DIR" -type f -iname '*.mp3' -exec rm "{}" \; -exec touch "{}" \;

echo "Building new sample data archive compressed-no-mp3-$SAMPLE_DATA_DIR.tgz..."
tar --exclude $EXCLUDE_FILES -czf "../compressed-no-mp3-$SAMPLE_DATA_DIR.tgz" "$SAMPLE_DATA_DIR"

echo "Building new sample data archive compressed-no-mp3-$SAMPLE_DATA_DIR.tbz..."
tar --exclude $EXCLUDE_FILES -cjf "../compressed-no-mp3-$SAMPLE_DATA_DIR.tbz" "$SAMPLE_DATA_DIR"

echo "Building new sample data archive compressed-no-mp3-$SAMPLE_DATA_DIR.tar.7z..."
tar --exclude $EXCLUDE_FILES -cf - "$SAMPLE_DATA_DIR" | 7za a -si "../compressed-no-mp3-$SAMPLE_DATA_DIR.tar.7z"

cd .. # get out of the tmp-work-dir
rm -r "$WORK_DIR"
