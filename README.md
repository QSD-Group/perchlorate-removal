# Perchlorate Removal Technologies

This repository contains the MATLAB scripts used for techno-economic analysis (TEA) and life cycle assessment (LCA) for the different perchlorate removal technologies described in [Hutchison et al., 2017](https://doi.org/10.1021/acs.est.7b00831) (include non-selective ion exchange, selective ion exchange, whole-cell biological reduction, chemical catalysis, and biocatalysis).

- The `LHS_Code` folder contains MATLAB scripts for Latin hypercube sampling.
- The `Technologies` folder contains MATLAB scripts for the five different technologies: BC (biocatalysis), CC (chemical catalysos), NS_IX_Type1 (non-selective ion exchange), S_IX (selective ion exchange), and WC (whole-cell biological reduction).
- The `Uncertain_Parameters` folder contains input parameter values (written and read by MATLAB) used in uncertainty analysis.
- The `Water_Constituents_Influent` folder contains data of the treatment influents used in the analysis.
- `Characterization_Factors.m` contains the characterization factors of inventory items used in LCA.
- `Costs.m` contains the codes for costing.
- `DV_UP_Conversions.m` contains the conversions, constants, decision variable and uncertain parameters for all of the technologies used in the analysis.