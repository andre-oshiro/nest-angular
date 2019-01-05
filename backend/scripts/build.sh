#!/bin/sh

cd `dirname $0`

sh ../../frontend/scripts/build.sh
[ $? -ne 0 ] exit 1

echo 'Backend build'
npm run format
[ $? -ne 0 ] && exit 1

npm run lint
[ $? -ne 0 ] && exit 1

npm run test
[ $? -ne 0 ] && exit 1

npm run build
[ $? -ne 0 ] && exit 1

echo 'copy to public'
rm -rf ../app/*.js && \
rm -rf ../app/*.ts && \
rm -rf ../app/*.map && \
rm -rf ../app/static/* && \
cp -r ../dist/* ../app && \
cp -r ../../frontend/dist/* ../app
[ $? -ne 0 ] && exit 1

echo 'Remove dists'
rm -rf ../../frontend/dist &&
rm -rf ../dist
[ $? -ne 0 ] && exit 1

exit 0
