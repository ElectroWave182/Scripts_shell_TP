#!/bin/bash


chmod 744 type.sh

# lecture

echo "Entrez votre nom d'élément complet..."

read nom
parametres=$(ls -l $nom);

type=$(./type.sh $nom);
permissions=$(echo $parametres | cut -d' ' -f1);


# type

echo -n "Il s'agit d'un "

if [ $type = "1" ]
then
	echo "fichier"
elif [ $type = "2" ]
then
	echo "dossier"
fi


# permissions

echo -n "ayant les permissions "

util=${permissions::-6}
echo $util

