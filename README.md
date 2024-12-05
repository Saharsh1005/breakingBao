# Breaking Bao: Evaluating Bao Optimizer on High-Complexity Benchmarks  

![Breaking Bao Banner](./docs/breakingbao-readme-banner.png)
## Introduction  
Query optimization is a cornerstone of database management systems, critical for efficient data retrieval and processing. This project explores the capabilities and limitations of Bao, a learned query optimizer for PostgreSQL, by testing it on high-complexity benchmarks. We aim to assess Bao’s adaptability and performance in novel scenarios such as skewed data, skewed queries, and dynamic workloads. Our experiments target optimizations in disk I/O, energy efficiency, and cache management while analyzing Bao’s robustness against changes in data and query characteristics.

---

## Tasks  

### **1. Query Transformations I**  
- Modified ImDb queries**  
  **IC:** *Vidhi Rambhia*  
  - Analyze how Bao handles schema evolution and dynamic changes (slightly modified queries).  
  - Visualize results through graphs showcasing the impact on performance.

### **2. Query Transformations II**  
- **Skew Data**  
  **IC:** *Saharsh Barve*  
  - Test bao on queries with mixed selectivity workloads (high selectivity | low selectivity).  
  - Train Bao on one cluster and evaluate its accuracy on others.  
  - Study performance metrics like execution efficiency and query accuracy.  

---

### **3. Data Transformations**  
- **Schema Changes**  
  - Dropped indexes to evaluate resilience to structural modifications
  - Investigate how this impacts optimization strategies and execution plans.

---

### **4. TPC-H Benchmarks**  
**IC:** *Vidhi Rambhia*  

---

### **4. Paper Writing**  
**IC:** *Rahul*  
- Focus on:  
  - Strategies that have "broken" query optimizers.  
  - Comparing our work with Bao and its benchmarks without redundancy.  

---

### **Slides**  
**IC:** *Omkar Dhekane* 
- Prepare **Slides** for project presentations.  

---

## Team Members  

- **Vidhi Rambhia**: vidhisr2@illinois.edu  
- **Rahul Bothra**: bothra2@illinois.edu  
- **Saharsh Barve**: ssbarve2@illinois.edu  
- **Omkar Dhekane**: dhekane2@illinois.edu  

## References
- Bao Tutorial: https://rmarcus.info/bao_docs/tutorial/2_bao_setup.html
- Bao paper: https://arxiv.org/pdf/2004.03814
- Bao github repo: https://github.com/learnedsystems/BaoForPostgreSQL
