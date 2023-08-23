#!/bin/bash

file_path="data/decoys/pregenerated.txt"
email=rendika.nurhartanto.21@student.ds.ittelkom-sby.ac.id
turing=hello

while IFS= read -r smiles; do
  echo "Processing SMILES: $smiles"
  curl -i -X POST -F "email=$email" -F "turing=$turing" -F "smiles=$smiles" https://dude.docking.org/generate/submit
  sleep 5
  echo ""
done <"$file_path"
