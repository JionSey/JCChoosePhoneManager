#!/bin/bash

git push
git tag $1
git push origin master --tags
pod lib lint JCChoosePhoneManager.podspec  --verbose --no-clean --allow-warnings
