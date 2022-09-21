# *Snakemake Population Genetics Workflow*

This workflow collects several of the necessary steps to perform a pop gen analysis with individual genomes. There are three main files that are required to use this workflow:
1. A parameter config file: a samples is located in config/parameters.yaml. Adjust the parameters in accourdance with your systems available resources.
2. A sample metadata file: an example can be found in test/samples.csv.
3. individual fastq files: This files can be store anywhere where you can have write and read access within the system. Just remember to add the location in the sample metadata file.

---------

## Running the workflow:

### Installation of required software:

### Ensure all require tools and are installed correctly:

### Testing the workflow:

### Generating a DAG graphs for the workflow

To run the DAG graph do:

```bash
snakemake --dag --use-conda -c all -s Snakefile | dot -Tpdf > ./fig/DAG.pdf
``` 

To make a filegraph with details of inputs and outputs (my prefered option)

```bash
snakemake --filegraph --use-conda -c all -s Snakefile | dot -Tpdf > ./fig/simple-filegraph-local-rules.pdf
```

