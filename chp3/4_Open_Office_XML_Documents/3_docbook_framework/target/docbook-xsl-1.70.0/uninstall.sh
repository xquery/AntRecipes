#!/bin/bash
mydir=$(readlink -f $(dirname $0))
$mydir/install.sh \
  --uninstall \
  --catalogManager=/home/msmith/.resolver/CatalogManager.properties \
  --dotEmacs= \
  $@
