# ALB to CloudWatch

This AWS Lambda function takes the ALB logs that are saved in S3 and then ships
them off to AWS CloudWatch.

## Building a new version

You will want to edit the source files for this lambda in the `./src/`
directory. Once you are ready to build a new release package you can do the
following:

```
./build.sh
```

The build script will ask you the version number you would like to build and
create a release package (`.zip`) in the main directory with that version in the
file name.

You are expected to manually upload the release package archive to the necessary
S3 buckets needed for the environments in which you will be running your lambda.
You may also consider putting the lambda in the main `-logs` environment to make
it easier to ship across multiple environments at once.

## Tracking changes to source

After a release it is highly recommended that you commit your changes to the
repository. You can revert a previous commit if you would like to build a
previous version.
