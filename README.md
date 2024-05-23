# HEA_Ballistic_ML-MOGA
This repository contains the dataset used for ML model construction, and MATLAB code for using the developed ML model for performing multi-objective genetic algorithm optimization.

**Molecular_Dynamics_data.xlsx**: MD simulation results consisting kinetic energy dissipation, penetration depth and residual velocity for different HEA configurations at stochastically varying impact velocity.

**MD_data2_5params.xlsx**: MD simulation results consisting kinetic energy dissipation, penetration depth and residual velocity for different HEA configurations at the impact velocity of 7.5 angstorm/ps (750 m/s).

**ML_models.mat**: Gaussian process ML models for all the three responses based on the dataset provided in Molecular_Dynamics_data.xlsx

**ML_models_5param.mat**: Gaussian process ML models for all the three responses based on the dataset provided in MD_data2_5params.xlsx

**MOGA_2responses.m**: MATLAB code for ML driven multi-objective genetic algorithm optimization (2 different responses at a time)

**MOGA_3responses.m**: MATLAB code for ML driven multi-objective genetic algorithm optimization (3 different responses at a time)

