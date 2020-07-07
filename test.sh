#!/bin/bash
timestamp=$(date +%s)
echo $timestamp
echo $timestamp >> newfile.txt
git add newfile.txt
git commit -m "adding $timestamp"
git push origin status-updates
