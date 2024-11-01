#!/bin/bash

IFS=$'\n'


echo $(date)


cd /etc
liste=$(cat passwd)


# parcours de la liste de tous les utilisateurs

col=1
while true
do
	user=$(echo $liste | cut -d' ' -f$col)

	if [ "$user" = "" ]
	then
		break
	fi


	# recherche de l'uid

	uid=$(echo $user | cut -d':' -f3)
	
	if [ $uid -ge 500 ]
	then
		nom=$(echo $user | cut -d':' -f1)
		echo $nom
	fi

	col=$(($col + 1))
done


cd $OLDPWD


echo $(date)


#[ -f $file ] fichier
#[ -d $file ] dossier
#[ -w $file ] on peut ecrire
#[ -x $file ] on peut executer
#[ -r $file ] on peut lire
