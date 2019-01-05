#!/bin/sh

echo 'Frontend build'
cd `dirname $0`

npm run lint
[ $? -ne 0 ] && exit 1

npm run test
[ $? -ne 0 ] && exit 1

npm run build
[ $? -ne 0 ] && exit 1

exit 0
