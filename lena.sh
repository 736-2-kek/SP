#!/bin/bash
echo -e
echo "Kineva Elena 736" 
echo "Work with repositories:"
echo "display a list of repositories"
echo "connect / disconnect repository"
echo -e
while :
do
	yum repolist all
	echo "Enter repo ID"
	while :
	do
        	read repo_id
        	echo "Enter 1 - enable, 2 - disable."
        	read status
 		case "$status" in
                	"1" )
                        yum-config-manager --enable $repo_id
                	yum clean all
                	yum makecache
                	echo "Repo $repo_id was enabled"; yum repolist all
                break
                ;;
                	"2" )
             		yum-config-manager --disable $repo_id
                	yum clean all
                	yum makecache
                	echo "Repo $repo_id was disabled"; yum repolist all
                break
                ;;
            		* ) echo "Wrong! Enter again" 1>&2
        	esac

	done
	while :
        do
                echo "Want to continue? 1 - yes, 2 - no."
                read choose
                case "$choose" in
                        "1" ) echo ""; break;;
                        "2" ) echo ""; echo "Exiting.."; exit 0;;
                        * ) echo "Error input! Try again" 1>&2;;
                esac
        done
done
