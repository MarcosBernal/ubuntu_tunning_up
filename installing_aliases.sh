#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo 'Adding custom_aliases files to the .bash_aliases file'
if [ -f $HOME/.bash_aliases ]; then
  echo -e '\n\n' 				 >> $HOME/.bash_aliases 
  cat $SCRIPTPATH/custom_aliases >> $HOME/.bash_aliases             
else
  cp  $SCRIPTPATH/custom_aliases $HOME/.bash_aliases
fi   


#echo 'Creating .bash_aliases folder in home directory'
#mkdir -p $HOME/.bash_aliases   

#echo 'Adding custom_aliases files to the .bash_aliases folder'
#cp $0/../custom_aliases.sh $HOME/.bash_aliases/custom_aliases.sh

#echo 'Adding line to .bashrc file to load custom_aliases'
#echo -e '# '
#echo -e 'if [ -f $HOME/.bash_aliases/custom_aliases.sh ]; then' >> $HOME/.bashrc
#echo -e '  . $HOME/.bash_aliases/custom_aliases.sh'             >> $HOME/.bashrc
#echo -e 'fi'                                                    >> $HOME/.bashrc

echo 'Setting Complete!!'