#!/bin/bash
source ~/.bashrc
npm install
nohup npm start 2>&1 1>calculator.log &