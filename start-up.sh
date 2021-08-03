#!/bin/bash

. /root/.bashrc
cd /privacybot/app/
flask run &
cd /privacybot/app/PB_UI
npm start
