#!/bin/sh
cd /Users/qiang.lilq/Documents/Obsidian\ Vault;git add .;git commit -m 'back up';git push origin master
echo "commit obsidian ok"

cd /Users/qiang.lilq/Documents/backup;git add . ; git commit -m 'backup'; git push origin main
echo "commit backup ok"
