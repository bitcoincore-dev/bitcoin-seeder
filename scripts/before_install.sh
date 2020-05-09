#!/usr/bin/env bash
echo " ___   ___   ___   ____   ____   ___           ___   _  _    ___   _____    _    _      _     "
echo "\  _) ) __( ) __( / __ \ /  _ \ ) __(         )_ _( ) \/ (  (  _( )__ __(  )_\  ) |    ) |    "
echo "|  (  | _)  | _)  ))__(( )  ' / | _)          _| |_ |  \ |  _) \    | |   /( )\ | (__  | (__  "
echo "/__o) )___( )_(   \____/ |_()_\ )___(  _____ )_____()_()_( )____)   )_(  )_/ \_()____( )____( "

checkbrew() {

    if hash brew 2>/dev/null; then
        #brew update
        #brew upgrade
        brew install openssl@1.1
        brew install autoconf automake libtool pkg-config boost boost-build gcc
        brew install iftop
        true
    else
        #We install homebrew if not exist
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        checkbrew
    fi
}
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if hash apt 2>/dev/null; then
        apt-get update
        apt-get install screen
        apt-get install make g++
        apt-get install build-essential libboost-all-dev libssl-dev
        apt-get install iftop
    fi
    true #checkbrew linuxbrew acting weird in travis-ci
elif [[ "$OSTYPE" == "darwin"* ]]; then
    checkbrew
    #symlink on your machine too...
    OPENSSL_VERSION=$(brew list --versions | grep -i -E  "openssl" | sed 's%openssl@1.1% %')
    echo $OPENSSL_VERSION
    ln -s /usr/local/opt/openssl/include/openssl /usr/local/include
    ln -s /usr/local/Cellar/openssl/$OPENSSL_VERSION/include/openssl /usr/bin/openssl
    ln -s /usr/local/opt/openssl/lib/libssl.1.1.dylib /usr/local/lib/
    ln -s /usr/local/opt/openssl/lib/libcrypto.1.1.dylib /usr/local/lib/
    ln -s /usr/local/opt/openssl/lib/libcrypto.a /usr/local/lib/
    which openssl
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
