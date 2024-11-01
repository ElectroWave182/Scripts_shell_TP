#!/bin/bash


parametres=$(ls -l $1);
type=$(echo $parametres | cut -d' ' -f2);
echo $type
