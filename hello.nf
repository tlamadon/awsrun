#!/usr/bin/env nextflow

cheers = Channel.from 'Bonjour', 'Hello'

process sayHello {
    echo true
    cpus 4

    input: 
        val x from cheers
    
    script:
    """
    #/home/ec2-user/miniconda/bin/aws s3 cp s3://tibostorage/myjob.sh myjob.sh   
    echo '$x world!'
    julia -v > julia.txt
    #/home/ec2-user/miniconda/bin/aws s3 cp julia.txt s3://tibostorage/julia.txt   
    """
}
