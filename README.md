# EU Procurement
This project analyzes EU procurement contract network data for the Applied Network Analysis course (GRAD-E1426) taught by [Phillip Lorenz-Spreen](https://www.mpib-berlin.mpg.de/staff/philipp-lorenz-spreen) at the [Hertie School](https://www.hertie-school.org/en/) in Berlin.

## Data

[`eu_procurements_alt`](https://networks.skewed.de/net/eu_procurements_alt): A collection of 234 networks representing the annual national public procurement markets of 26 European countries from 2008-2016. Data is sourced from Tenders Electronic Daily (TED), the official procurement portal of the European Union. Nodes with the suffix "_i" are issuers (sometimes referred to as buyers) of public contracts, for instance public hospitals, ministries, local governments. Nodes with the suffix "_w" are winners (sometimes called suppliers) of public contracts, generally private-sector firms. Each network is bipartite: links represent contracting relationships between issuers and winners. 

### Node properties
* `label`: IDs of issuers and winners are consistent across time and within countries. Node IDs have been randomly generated and do not correspond to any official statistics. Identities have been statistically de-duplicated, as described in the paper by [Wachs, Fazekas, & Kertész](https://link.springer.com/article/10.1007/s41060-019-00204-1).

### Link properties
* `count`: Measures the volume of contracts between the issuer and winner in the given year. This attribute can be interpreted as a weight or strength of the relationship.
* `pctSingleBid`: Describes the share of contracts between the issuer and winner awarded without competition, i.e. with the winner as single bidder or sole-supplier. Note: missing data on single-bidding is imputed. This is an elementary indicator of corruption risk of the contract. For more information consult [the paper referenced above](https://link.springer.com/article/10.1007/s41060-019-00204-1).

## Method
* Throughout the project workflow, [Google Colab](https://colab.research.google.com/) was used to write and execute Python code. Code provided by [Tiago P. Peixoto (@count0)](https://github.com/count0/colab-gt/blob/master/colab-gt.ipynb) enabled the use of the `graph-tool` package in the Colab environment.
* The `eu_procurements` dataset was imported directly from the `graph-tools` package.

## Sources
* J. Wachs, M. Fazekas, and J. Kertész; Corruption Risk in Contracting Markets: A Network Science Perspective.&quot; International Journal of Data Science and Analytics, pp 1–16 (2020), https://link.springer.com/article/10.1007%2Fs41060-019-00204-1.
* Contracts data dictionary associated for the `eu_procurements` data set can be found [here](https://zenodo.org/records/3537986).

## Additional Resources
* [@briatte | A curated list of awesome network analysis resources. ](https://github.com/briatte/awesome-network-analysis)
* [Towards Data Science | Tutorial: Network Visualization Basics with Networkx and Plotly in Python](https://towardsdatascience.com/tutorial-network-visualization-basics-with-networkx-and-plotly-and-a-little-nlp-57c9bbb55bb9)
* [graph-tool](https://graph-tool.skewed.de/)
* [How to Use Graph-Tool in Google Colab](https://colab.research.google.com/github/count0/colab-gt/blob/master/colab-gt.ipynb#scrollTo=GQ18Kd5F3uKe)
