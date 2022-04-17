#!/bin/bash
SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

if [[ ! -e ~/miniconda3 ]]
then
	MINICONDA_INSTALL_SH="${SCRIPT_DIR}/Miniconda3-latest-Linux-x86_64.sh"
	if [[ ! -e $MINICONDA_INSTALL_SH ]]; then
		wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $MINICONDA_INSTALL_SH
	fi
	bash $MINICONDA_INSTALL_SH
	rm $MINICONDA_INSTALL_SH
fi

# copy .condarc to ~
if [[ ! -e ~/.condarc ]]
then
	cp ${SCRIPT_DIR}/.condarc ~
fi

# install conda envs
cat ${SCRIPT_DIR}/envs/envs.txt | while read env; do 
echo $env
if [[ -z `conda env list | grep ${env}` ]]
then
	echo "conda env create -f=${SCRIPT_DIR}/envs/${env}.yml -n ${env}"
	conda env create -f=${SCRIPT_DIR}/envs/${env}.yml -n ${env}
fi
done

if [[ -e ~/miniconda3/envs/nodejs/bin/node ]]
then
	ln -s ~/miniconda3/envs/nodejs/bin/node ~/.local/bin/node
fi

if [[ -e ~/miniconda3/envs/nodejs/bin/npm ]]
then
	ln -s ~/miniconda3/envs/nodejs/bin/npm ~/.local/bin/npm
fi


