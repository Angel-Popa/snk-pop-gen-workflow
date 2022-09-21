########################
### Pop Gen Workflow ###
###     v.0.0.1      ###
###                  ###
########################

## Config:
import pandas as pd
import yaml

shell.prefix("set -euo pipefail;")

## Parameters:
parameters = yaml.load(open("config/parameters.yml", "r"), Loader=yaml.SafeLoader)

## Input samples:
samples = pd.read_csv(".test/data/samples.csv", dtype="str")

## Functions to use in all rules:
include: "workflow/rules/common.smk"

## Rules:
include: "workflow/rules/renaming.snk"
include: "workflow/rules/index_bwamem2.snk"
include: "workflow/rules/qc_trimmomatic.snk"
include: "workflow/rules/mapping_bwamem2.snk"
include: "workflow/rules/bcftools_calling.snk"

#localrules: all, make_symlinks, raw_extract_genome, map_bwa_mem2_index, bcf_call, bcf_merge, bwa_mem2_mem, duplicated_filter, duplicated_split, qc_trimmomatic, samtools_index, samtools_index_filtered, vcf_filtering
localrules: all, make_symlinks, raw_extract_genome, map_bwa_mem2_index

rule all:
    input:
        "data/results/vcf_filtering/call_filtered-Q20.vcf"