#!/bin/bash
echo
echo "Kineva Elena 736" 
echo "Work with repositories:"
echo "display a list of repositories"
echo "connect / disconnect repository"
echo
while :
do
    yum repolist all
    echo "Enter repo ID"
    while :
    do
        read repo_id
        found_enabled=$(yum repolist enabled | grep $repo_id | tr " " "\n" | head -1)
        found_disabled=$(yum repolist disabled | grep $repo_id | tr " " "\n" | head -1)
        case "$repo_id" in "$found_enabled" ) yum-config-manager --enable $repo_id
                yum clean all
                yum makecache
                echo "Repo $repo_id was disabled"; break;;
            "$repo_id" in "$found_disabled" ) yum-config-manager --disable $repo_id
                yum clean all
                yum makecache
                echo "Repo $repo_id was enabled"; break;;
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
