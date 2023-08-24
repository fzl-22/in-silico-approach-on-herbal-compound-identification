#!/bin/bash

if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

while IFS= read -r smiles; do
  echo "Processing SMILES: $smiles"
  curl -i -X POST -F "email=$EMAIL" -F "turing=$TURING" -F "smiles=$smiles" $DUDE_URL
  sleep 5
  echo ""
done < $COMPOUND_PATH
