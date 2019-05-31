#!/usr/bin/env bash

# param1 : 1.7 |1.8| 1.9

JDK_VERSION=$1

if [[ ! -n "${JDK_VERSION}" ]]; then
    JDK_VERSION="java-1.8.0-openjdk"
    echo -e "Aare u sure install default version : ${JDK_VERSION} \n"
    read -s -n1 -p "Press any key to continue or [Ctrl+C] exit install... "
else
    JDK_VERSION="java-${JDK_VERSION}.0-openjdk"
    echo -e "Aare u sure install version : ${JDK_VERSION} \n"
    read -s -n1 -p "Press any key to continue or [Ctrl+C] exit install... "
fi

yum install -y ${JDK_VERSION}

