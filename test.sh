#!/bin/bash

# start with the template branch for this test
git checkout auto-cancel

# create a new branch and push to the remote.  This will trigger the first build.
branchName="auto-cancel-"`date +%s`
echo $branchName
git checkout -b $branchName
git push origin $branchName

# make an edit and push the branch again.  This will trigger the second build.
filename="$branchName.txt"
echo $filename
touch $filename
git add $filename
git commit -m "test script added new file"
git push origin $branchName

# Give CI a chance to run the tests
sleep 45

# clean up the testing branch
git push origin --delete $branchName
