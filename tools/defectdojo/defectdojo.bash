#!/bin/bash

TOOLS="/app/tools"
REPORTS="/opt/reports/imports"
DOJO_IP=$(cat /app/tools/ip.conf | tail -n 1)

# Copy the reports directory over to the defectdojo area
cp -r $REPORTS $TOOLS/defectdojo/
# Move the defectdojo tooling
cd $TOOLS/defectdojo
# Install requests
pip3 install requests
# Run the importer
python3 dojo_import.py \
--url "http://$DOJO_IP" \
--token "d5ec74ba8c0e6a82e3bfe0b40c202d3fd60940e5" \
--project_name "Juice Shop"

cp -r $TOOLS/defectdojo/imports /opt/reports
rm -rf $TOOLS/defectdojo/imports
