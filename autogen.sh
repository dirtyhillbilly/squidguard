#!/bin/sh
#
# autogen.sh for source packages to create 'configure'

echo

if [ "$1" = "clean" ]; then

  echo "autoclean: remove all generated files ..."

  [ -f Makefile ] && make distclean
  rm -f configure install-sh config.log src/config.h*
  sleep 0.2

  echo "autoclean: finished."

else

  if [ -f configure.ac ]; then

      autoreconf --verbose --force
      automake --no-force --add-missing --copy 2>/dev/null

      [ -d autom4te.cache ] && rm -rf autom4te.cache
      [ -d .git ] && rm -rf .git

      echo "autoreconf: finished - now you can start ./configure"

  else
    echo "file configure.ac not found - abort!"
  fi

fi

echo

# EOF
