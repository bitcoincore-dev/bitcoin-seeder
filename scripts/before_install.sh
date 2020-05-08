#!/usr/bin/env bash
echo " ___   ___   ___   ____   ____   ___           ___   _  _    ___   _____    _    _      _     "
echo "\  _) ) __( ) __( / __ \ /  _ \ ) __(         )_ _( ) \/ (  (  _( )__ __(  )_\  ) |    ) |    "
echo "|  (  | _)  | _)  ))__(( )  ' / | _)          _| |_ |  \ |  _) \    | |   /( )\ | (__  | (__  "
echo "/__o) )___( )_(   \____/ |_()_\ )___(  _____ )_____()_()_( )____)   )_(  )_/ \_()____( )____( "

checkbrew() {

    if hash brew 2>/dev/null; then
        #brew update
        #brew upgrade
        #install brew libs
        #do something else after installed dep
        #example - pipe remote script into bash with wget
        #sudo wget -qO - https://gist.githubusercontent.com/RandyMcMillan/634bc660e03151a037a97295b01a0369/raw/28deda7c03eb4c8a300c4c3eabd76c0f732ca5da/disable.sh | bash
        true
    else
        #example - execute script with perl
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        checkbrew
    fi
}
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    true #checkbrew
elif [[ "$OSTYPE" == "darwin"* ]]; then
    checkbrew
    brew link openssl
    export LDFLAGS=-L/usr/local/opt/openssl@1.1/lib
    export CPPFLAGS=-I/usr/local/opt/openssl@1.1/include
    export PKG_CONFIG_PATH=/usr/local/opt/openssl@1.1/lib/pkgconfig
    echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile
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

