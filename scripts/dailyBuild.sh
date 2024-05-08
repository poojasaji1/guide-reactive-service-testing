#!/bin/bash
while getopts t:d:b:u: flag;
do
    case "${flag}" in
        t) DATE="${OPTARG}";;
        d) DRIVER="${OPTARG}";;
        b) BUILD="${OPTARG}";;
        u) DOCKER_USERNAME="${OPTARG}";;
        *) echo "Invalid option";;
    esac
done

sed -i "\#</containerRunOpts>#a<install><runtimeUrl>https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/nightly/$DATE/$DRIVER</runtimeUrl></install>" inventory/pom.xml system/pom.xml
cat inventory/pom.xml system/pom.xml

if [[ "$DOCKER_USERNAME" != "" ]]; then
    sed -i "s;FROM icr.io/appcafe/open-liberty:kernel-slim-java11-openj9-ubi;FROM $DOCKER_USERNAME/olguides:$BUILD;g" system/Dockerfile inventory/Dockerfile
    sed -i "s;RUN features.sh;#RUN features.sh;g" inventory/Dockerfile system/Dockerfile
    cat inventory/Dockerfile system/Dockerfile
fi

../scripts/testApp.sh
