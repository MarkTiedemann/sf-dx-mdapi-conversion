#!/bin/sh
set -ex

# Clone the example DX project
git clone https://github.com/dreamhouseapp/dreamhouse-sfdx
(cd dreamhouse-sfdx; git checkout e2420b)

# Download and install the SF DX CLI
curl -O https://developer.salesforce.com/media/salesforce-cli/sfdx-cli/channels/stable/sfdx-cli-v6.56.0-e3fd846a1f-darwin-x64.tar.xz
tar -xJf sfdx-cli-v6.56.0-e3fd846a1f-darwin-x64.tar.xz
chmod +x sfdx-cli-v6.56.0-e3fd846a1f-darwin-x64/bin/sfdx

# Convert the DX project into a MD package
(cd dreamhouse-sfdx; ../sfdx-cli-v6.56.0-e3fd846a1f-darwin-x64/bin/sfdx force:source:convert --rootdir=force-app/main/default --outputdir=metadata --packagename=metadata)

# Convert the MD package back into a DX project
(cd dreamhouse-sfdx; ../sfdx-cli-v6.56.0-e3fd846a1f-darwin-x64/bin/sfdx force:mdapi:convert --rootdir=metadata --outputdir=dx)

# Create a diff betweeen the original DX project and the converted one
git diff --no-index dreamhouse-sfdx/force-app/main/default dreamhouse-sfdx/dx/main/default >> dx.diff
