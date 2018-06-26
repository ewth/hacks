#!/bin/bash

pull_the_plug() {
    if [ "${?}" != "0" ]; then
        cd ${PREVDIR}
        echo ""
        echo -e "\033[31;1m*** TEST FAILED **\033[0m"
        echo ""
        exit 1
    fi
}

PREVDIR=`pwd`
echo ""
echo -e "\033[92;1mRunning Testing\033[0m"
echo ""
echo "Running Standard Test #1..."
cd ~/www/speqs
vendor/bin/phpcs -d memory_limit=128M app/code/Speqs --extensions=php,phtml --standard=EcgM2,psr1,psr2 --report-width=150 --warning-severity=0 --ignore=app/code/Speqs/Commercebug/*
pull_the_plug
echo -e "\033[32m[1/3] Passed!\033[0m"
echo "Running Standard Test #2..."
vendor/bin/phpcs -d memory_limit=128M vendor/bin/phpcs bin/Speqs --extensions=php --standard=psr1,psr2 --report-width=150 --warning-severity=0
pull_the_plug
echo -e "\033[32m[2/3] Passed!\033[0m"
echo "Running Unit Tests..."
php -d memory_limit=512M vendor/phpunit/phpunit/phpunit -c dev/tests/unit/phpunit.xml.dist app/code/ --colors app/code
pull_the_plug
echo -e "\033[32m[3/3] Passed!\033[0m"
echo ""
echo -e "\033[92;1mAll tests passed!\033[0m"
cd ${PREVDIR}
