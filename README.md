# awsrun
Running a script on aws

## Links

- [fetch and run](https://aws.amazon.com/blogs/compute/creating-a-simple-fetch-and-run-aws-batch-job/)
- [Nextflow on AWS batch](https://antunderwood.gitlab.io/bioinformant-blog/posts/running_nextflow_on_aws_batch/)
- [Another nextflow for awsbatch](https://github.com/nextflow-io/awesome-nextflow)

- [terraform nextflow aws batch](https://githubmemory.com/repo/independentdatalab/tf-aws-env-nf)
- [cloudformation nextflow](https://aws.amazon.com/quickstart/biotech-blueprint/nextflow/)
- [cloudformation hellow world aws batch](https://aws.amazon.com/blogs/compute/using-aws-cloudformation-to-create-and-manage-aws-batch-resources/)

- [terraform working aws batch example](https://github.com/QuiNovas/terraform-aws-batch-compute-environment)


1. install docker
2. start docker `sudo systemctl start docker`
3. create an IAM role as explained in the first link, call it `batchJobRole`


## Using containers

The following interact with your local docker client

```bash
# show active containers
docker container ls

# show local images
docker images

# build a docker image
docker build -t awsrun .   
```

Next we need to push the created image to the Amazon register

```shell
# export my ECR address
export aws_ecr="870777542080.dkr.ecr.us-east-1.amazonaws.com"

# login
aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin "$aws_ecr"

# tag and push the image
sudo docker tag awsrun:latest "$aws_ecr/awsrun:latest"
sudo docker push "$aws_ecr/awsrun:latest"

```


## Using S3

```shell
# copy a file to a s3 bucket
aws s3 cp myjob.sh s3://tibostorage/myjob.sh
```

## Using nextflow with containers

```
~/nextflow hello.nf -with-docker julia:1.5 
```