# Reproducibility of AI Trojan Detector Results  

#### SURF Student: Johannes Losert, Columbia University '25
#### Mentor: Dr. Derek Juba 

### Documentation for this project can be found under the 'documentation' folder. It contains a Jupyter Notebook that details all the tests that were run to produce the results presented in the SURF presentation. For those curious about the software framework that was used to run our tests, the 'testing' folder contains the software developed for and used in our research. 

## Abstract:

AI Trojans are malicious and intentional attacks that change the behavior of an AI by inserting hidden classes. To motivate research into Trojan detectors, NIST administered the TrojAI competition, where teams submit algorithms that detect Trojan AI models. The detector algorithms are known to output slightly different results across systems. These differences are problematic for scientific study of the algorithms because it means that results aren’t reproducible. This problem was the motivation for my NIST SURF project in which my mentor, Derek Juba, and I researched how algorithms submitted to the TrojAI competition behave when run in different environments. Submitted algorithms are containerized using Singularity which allows them to be easily run on broad range of machines. We tried to test the algorithms on as many combinations of software and hardware as possible (CPU core count, GPU drivers, etc.) in order to deduce potential causes of differing results.

We theorized that one of the main reasons for differences in the results across systems was changes in the orders in which floating point arithmetic operations were being performed. With this in mind, we attempted to quantify the uncertainty resulting from the choice of system without running the container on different systems. We simulated different orders of operations by tweaking the weights and biases of an AI model by a small amount. We used multiple random samples of such tweaks to find the variance we can expect in results if someone were to run an algorithm on a given model across different machines. Early analysis of the data suggests that results produced on other machines agreed with the variance we predicted with our tweaks and that the statistical distributions of tweaked models are largely reproducible across machines. Additionally, we propose that that the variance of the tweaked distributions can be used to score the confidence of detector algorithms.

Disclaimer about version control history: The original repository of the project is located on a NIST GitLab server, and I have only been able to port over the finished product. For this reason the version control history of this repository can be ignored.

