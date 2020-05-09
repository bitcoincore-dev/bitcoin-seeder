#!/usr/bin/env bash
echo "  ___   _  _    ___   _____    _    _      _     "
echo " )_ _( ) \/ (  (  _( )__ __(  )_\  ) |    ) |    "
echo " _| |_ |  \ |  _) \    | |   /( )\ | (__  | (__  "
echo ")_____()_()_( )____)   )_(  )_/ \_()____( )____( "
if [[ "$OSTYPE" == "linux-gnu" ]]; then
if hash apt 2>/dev/null; then
true
fi
true #checkbrew linuxbrew acting weird in travis-ci
elif [[ "$OSTYPE" == "darwin"* ]]; then
true
elif [[ "$OSTYPE" == "cygwin" ]]; then
echo TODO add support for $OSTYPE
elif [[ "$OSTYPE" == "msys" ]]; then
echo TODO add support for $OSTYPE
elif [[ "$OSTYPE" == "win32" ]]; then
echo TODO add support for $OSTYPE
elif [[ "$OSTYPE" == "freebsd"* ]]; then
echo TODO add support for $OSTYPE
else
echo TODO add support for $OSTYPE
fi
