#!/bin/bash
#SBATCH --job-name=pia2_hit_gen    # Job name
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=yashsondhi@gmail.com     # Where to send mail	
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --mem=8gb                     # Job memory request
#SBATCH --time=2:00:00               # Time limit hrs:min:sec
#SBATCH --output=serial_test_%j.log   # Standard output and error log
#SBATCH --qos=kawahara

module load gcc/5.2.0 mkl/2018.1.163 libffi/3.2.1 netcdf-c/4.3.3.1 hdf5/1.8.16 python/2.7.10 java/9.0.1 mafft/7.294 raxml/8.2.10 usearch/9.2.64 pia2/20180305 singularity/2.6.0 R/3.4.3 libplplot/5.10.0 perl/5.16.0 ncbi_blast/2.7.1
./run_pia.sh
