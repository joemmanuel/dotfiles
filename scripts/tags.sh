#!/bin/bash
pushd /opt/omegaup/frontend
exec ctags-exuberant -f tags \
	-h \".php\" -R \
	--exclude=\"\.git\" \
	--totals=yes \
	--tag-relative=yes \
	--PHP-kinds=+cf \
  --regex-PHP='/abstract class ([^ ]*)//c/' \
	--regex-PHP='/interface ([^ ]*)//c/' \
	--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/ /f/'
popd
