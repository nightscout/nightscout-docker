#!/bin/bash
# This script generates a unique password for the API Key, the MongoDB password and MQTT Username
# To use it, ensure you use . ./envgen.sh (noting the first dot) to set the variables for the current shell
# Then, simply run docker-compose up
echo ""
echo ""
echo "Generating API key and MongoDB password..."
echo "========================================================================================"

# Generate passwords
export  NIGHTSCOUT_APIKEY=`docker run --rm timbutler/simplepass 12 1`
export  MONGODB_PASS=`docker run --rm timbutler/simplepass 12 1`
export  MQTT_USER=`docker run --rm timbutler/simplepass 8 1`

# Print to the screen for reference
echo "Nightscout API key: $NIGHTSCOUT_APIKEY"
echo "MongoDB Admin Password: $MONGODB_PASS"
echo "MQTT User: $MQTT_USER"
echo "========================================================================================"
echo ""
echo "Now you can run "docker-compose up" to build and start the Docker containers"
echo ""