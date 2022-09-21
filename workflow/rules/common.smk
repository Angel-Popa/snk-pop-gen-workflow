

## Function to get the samples names
def get_sequences(wildcards):
    spp = wildcards.species
    pop = wildcards.population
    ind = wildcards.individual
    R1, R2 = (samples[(samples["species"] == spp) & (samples["population"] == pop) & (samples["individual"] == ind)][["R1", "R2"]].values.tolist()[0])
    return R1, R2

## Trimm the raw sequences
def get_adaptor(wildcards):
    spp = wildcards.species
    pop = wildcards.population
    ind = wildcards.individual
    adaptor = (samples[(samples["species"] == spp) & (samples["population"] == pop) & (samples["individual"] == ind)]["adaptor"].values.tolist()[0])
    return adaptor


def get_phred(wildcards):
    spp = wildcards.species
    pop = wildcards.population
    ind = wildcards.individual
    phred = (samples[(samples["species"] == spp) & (samples["population"] == pop) & (samples["individual"] == ind)]["phred"].values.tolist()[0])
    return phred


def get_trimmomatic_params(wildcards):
    return parameters["trimmomatic"]["extra"].strip()

def compose_rg_tag(wildcards):
    identifier = "ID:" + wildcards.species + "_" + wildcards.population + "_" + wildcards.individual
    individual = "LB:truseq_" + wildcards.individual
    platform = "PL:Illumina"
    sample = "SM:" + wildcards.species + wildcards.population
    return f"@RG\t{identifier}\t{individual}\t{platform}\t{sample}"

def get_files_bcf(wildcards):
    files = expand("data/results/bcf_ind/{species}.{population}.{individual}.bcf", 
        species = samples["species"], population = samples["population"], individual = samples["individual"])
    return files


