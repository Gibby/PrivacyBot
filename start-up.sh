#!/bin/bash

. /root/.bashrc
cd /app/
flask run &
cd /app/PB_UI
npm start
