#!/bin/bash

IFS=$'\n'


cd /home/ecauss04/Téléchargements
complet_tele=$(ls)

echo "Quelle playlist voulez-vous formater ?"
read nom
echo $complet_tele

# Précondition : la playlist existe

trouve=false

for ele in $complet_tele
do
	if [ $ele = $nom ]
	then
		trouve=true
		break
	fi
done

if ! $trouve
then
	echo "La playlist $nom n'existe pas"
	exit 1
fi

cd $nom


# Critere 1

complet_play=$(ls)

for artiste in $complet_play
do
	if [ -f $artiste ]
	then
		echo "Votre playlist $nom contient un fichier $artiste"

	else
		cd $artiste


		# Critere 2

		complet_artiste=$(ls)

		for album in $complet_artiste
		do
			if [ -f $album ]
			then
				echo "Votre artiste $artiste contient un fichier $album"

			else
				cd $album


				# Critere 3

				complet_album=$(ls)

				for chanson in $complet_album
				do
					if [ -f $chanson ]
					then
						numero=$(echo $chanson | cut -d' ' -f1)
						tiret=$(echo $chanson | cut -d' ' -f2)

						if [ "$numero" >= ":" ] || [ "$numero" < "0" ]
						then
							echo "Votre musique $chanson ne commence pas par un numero"

						elif [ "$tiret" = "-" ]
						then
							echo "Votre musique $chanson n'a pas de tiret"

						else
							# Critere 4 (to do)


						fi
					else
						echo "Votre album $album contient un dossier $chanson"
					fi
				done

				cd ..
			fi
		done

		cd ..
	fi
done

cd ..
