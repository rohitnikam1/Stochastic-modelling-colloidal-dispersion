# Stochastic Modelling (Brownian Dynamics) of Colloidal Dispersion

In 1827 the botanist Robert Brown examined under his microspcope pollen of plants suspended in water. He observed that the pollen, about a micrometer in diameter, performed stochastic motions of the order of 10 micrometers. Even though Brown could not explain the cause of this motion any continuous stochastic process like that of a pollen is now referred to as **Brownian dynamics**.

In this project (full report can be found at ![bd_colloidal_suspension.pdf](https://github.com/rohitnikam1/Stochastic-process-colloidal-dispersion/blob/master/bd_colloidal_suspension.pdf)), we implement a numerical technique that generates a solution of the ![Fokker-Planck equation](https://en.wikipedia.org/wiki/Fokker%E2%80%93Planck_equation) (a partial differential equation that describes the time evolution of the probability density function of the velocity of a particle under the influence of drag forces and random forces) by simulating an ensemble of stochastic processes. Due to these stochastic processes one calls this numerical method Brownian dynamics as well.

The system we have at hand is a monodisperse dispersion of micrometer sized colloidal particles. The particles interact with each other via electrostatic and many-body hydrodynamic interactions, while there is an additional random force of stochastic origin, due to the constant bombardment of surrounding liquid molecules on the colloidal particle. The direction of this force is constantly changing, as at different times the particle is hit more on one side than another, leading to the seemingly random nature of the motion. 

In this project, we implement ![Ermak-McCammon algorithm](https://aip.scitation.org/doi/10.1063/1.436761) for simulating the Brownian dynamics motion of the colloidal particles. The simulation helps to calculate a range of dynamic physical properties of the dispersion.
