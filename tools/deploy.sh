#!/usr/bin/bash
cd bin
php ./magento setup:upgrade --keep-generated
cd ..
php ./bin/magento setup:static-content:deploy en_AU en_US --area adminhtml
php ./bin/magento setup:static-content:deploy en_AU en_US --theme Speqs/default --area frontend
cd bin
php ./magento deploy:mode:set production --skip-compilation
php ./magento cache:flush
cd ..
