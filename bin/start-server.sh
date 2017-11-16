#!/bin/bash
cd
source .bashrc
npm install
nohup npm start 2>&1 1>calculator.log &
NODE_ENV="production" PORT=1338 nohup sails lift 2>&1 1>api.production.log &