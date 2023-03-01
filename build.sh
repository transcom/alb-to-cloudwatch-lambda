#!/usr/bin/env bash

file_prefix="lambda_alb_to_cloudwatch-v"

# ask user to input a version number
echo "Enter a version number to build: "
read -r version

tmp_working_directory="tmp-v${version}"

# make a directory with the version number
mkdir "$tmp_working_directory"

# copy the source files from the src directory to the new directory
cp -r src/* "$tmp_working_directory"/

# change into the new directory
pushd "$tmp_working_directory" || exit

# archive all files in the new directory to a zip file
zip -q -r "../$file_prefix$version.zip" .

# remove the new directory
popd || exit
rm -rf "$tmp_working_directory"

echo ""
echo "Finished building, release file is: $file_prefix$version.zip"
