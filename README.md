# EU Procurement
This project analyzes EU procurement contract network data for the Applied Network Analysis course (GRAD-E1426) taught by [Phillip Lorenz-Spreen](https://www.mpib-berlin.mpg.de/staff/philipp-lorenz-spreen) at the [Hertie School](https://www.hertie-school.org/en/) in Berlin. I collaborated with fellow Hertie students [Kai Foerster](https://github.com/kaifoerster), [Danial Riaz](https://github.com/danialriaz/), and [Lukas Lehmann](https://github.com/lukaslehmann-R) to perform the analysis and present our findings.

![Slovakia's public procurement network, 2014](https://raw.githubusercontent.com/smkerr/EU_procurement/main/img/default_layout/SK_2014.png)

## Data

[`eu_procurements_alt`](https://networks.skewed.de/net/eu_procurements_alt): A collection of 234 networks representing the annual national public procurement markets of 26 European countries from 2008-2016. Data is sourced from Tenders Electronic Daily (TED), the official procurement portal of the European Union. Nodes with the suffix "_i" represent issuers (sometimes referred to as "buyers") of public contracts, for instance public hospitals, ministries, local governments. Nodes with the suffix "_w" represent winners (sometimes referred to as "suppliers") of public contracts, generally private-sector firms. Each network is bipartite: links represent contracting relationships between issuers and winners. 

### Node properties
* `label`: IDs of issuers and winners are consistent across time and within countries. Node IDs have been randomly generated and do not correspond to any official statistics. Identities have been statistically de-duplicated, as described in the paper by [Wachs, Fazekas, & Kertész](https://link.springer.com/article/10.1007/s41060-019-00204-1).

### Link properties
* `count`: Measures the volume of contracts between the issuer and winner in the given year. This attribute can be interpreted as a weight or strength of the relationship.
* `pctSingleBid`: Describes the share of contracts between the issuer and winner awarded without competition, i.e. with the winner as single bidder or sole-supplier. This is an elementary indicator of corruption risk of the contract. For more information consult [the paper referenced above](https://link.springer.com/article/10.1007/s41060-019-00204-1).

## Method
* Throughout the project workflow, [Google Colab](https://colab.research.google.com/) was used to write and execute Python code. Code provided by [Tiago P. Peixoto (@count0)](https://github.com/count0/colab-gt/blob/master/colab-gt.ipynb) enabled the use of the `graph-tool` package within the Google Colab environment.
* The `eu_procurements` dataset was imported directly from the `graph-tools` package.

## Sources
* [`eu_procurements_alt`](https://networks.skewed.de/net/eu_procurements_alt) EU national procurement networks (2008-2016) dataset
* J. Wachs, M. Fazekas, and J. Kertész; "Corruption Risk in Contracting Markets: A Network Science Perspective." International Journal of Data Science and Analytics, pp 1–16 (2020), https://doi.org/10.1007/s41060-019-00204-1.
* A. Barabási; *Network Science*. Cambridge University Press (2015), http://www.networksciencebook.com/.
* T. Fruchterman and E. Reingold; "Graph drawing by force-directed placement." Journal of Software: Practice and Experience, pp 1129-1164 (1991), https://doi.org/10.1002/spe.4380211102.
* [`NetworkX` Documentation](https://networkx.org/documentation/stable/)
* [`graph-tool` Documentation](https://graph-tool.skewed.de/static/doc/index.html)
* [DataCamp | Python Tutorial: Bipartite graphs](https://www.youtube.com/watch?v=IjomzV8Crxg)
* Contracts data dictionary associated with the `eu_procurements` data set can be found [here](https://zenodo.org/records/3537986).
* Code provided by [Tiago P. Peixoto (@count0)](https://github.com/count0/colab-gt/blob/master/colab-gt.ipynb) enabled the use of the graph-tool package in the Colab environment.
* [How to Use Graph-Tool in Google Colab](https://colab.research.google.com/github/count0/colab-gt/blob/master/colab-gt.ipynb#scrollTo=GQ18Kd5F3uKe)
