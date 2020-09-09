# Some custom Turris Packages
Just a small collection of packages for Turris OS (OpenWRT) that I build in my free time. Don't expect anything. Not even that it builds... 

**Featuring**:
* [Docker 18.09 CE](#docker-1809-ce)



## TLDR: I just want docker on Turris Omnia
1. Install Repo: curl `https://raw.githubusercontent.com/selwtf/turris/master/toolchain/install/install.sh | sh -`
   ⚠️**ATTENTION**⚠️: This will install selwtf (my) repository public keys in your Turris Device!
2. Install 'docker' package: `opkg update && opkg install docker`



## Packages
### Docker 18.09 CE
[![Build Status](https://dev.azure.com/selwtf/turris/_apis/build/status/pkg-docker?branchName=master)](https://dev.azure.com/selwtf/turris/_build/latest?definitionId=6&branchName=master)

**TODO**


## Container-optimized Kernel (cok)

**TODO**



## CI
CI builds are run using Azure Pipelines

**Repository** is [here](https://iamsorrybutididntdoityet)

**Build Jobs** are [here](https://dev.azure.com/selwtf/turris/_build)

**(Toolchain) Docker Images** are [here](https://hub.docker.com/u/selwtf)

**Pipeline definitions** are in */.azure-pipelines* (or for simple pipelines: *./azure-pipeline.yaml*)



## Turris Toolchain
Build Images for developing software on [Turris devices](https://www.turris.cz/en/):
* **turris-sdk**: Toolchain to build specific package for stock Turris OS
* **turris-ck-sdk**: Toolchain to build specific package for Turris OS with *container-optimized kernel* \[**WIP!**\]

### turris-sdk 
[![Build Status](https://dev.azure.com/selwtf/turris/_apis/build/status/toolchain-sdk?branchName=master)](https://dev.azure.com/selwtf/turris/_build/latest?definitionId=5&branchName=master)

*TODO*


### turris-base 
[![Build Status](https://dev.azure.com/selwtf/turris/_apis/build/status/toolchain-base?branchName=master)](https://dev.azure.com/selwtf/turris/_build/latest?definitionId=4&branchName=master)

*TODO*