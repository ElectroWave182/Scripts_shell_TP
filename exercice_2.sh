#!/bin/bash


chmod 744 type.sh

# lecture des noms des éléments

IFS=$'\n'

complet=$(ls);
debut="-----------\nLes fichiers de $PWD sont :"
chaine="\n-----------\nLes répertoires de $PWD sont :"


# parcours du dossier élément par élément

col=1
while true
do
	ele=$(echo $complet | cut -d' ' -f$col);

	if [ "$ele" = "" ]
	then
		break
	fi

	nom=$(echo $ele | cut -d'.' -f1);


	# séparation fichiers / dossiers

	type=$(./type.sh $ele);
	if [ $type = "1" ]
	then
		# c'est un fichier, donc on le rajoute à gauche
		chaine='\n'$nom$chaine

	else
		# c'est un dossier, donc on le rajoute à droite
		chaine=$chaine'\n'$nom

	fi

	col=$(expr $col + 1);
done

echo -e $debut$chaine

