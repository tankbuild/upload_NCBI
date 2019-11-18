# upload_NCBI
## Download and install Aspera
   1. download Aspera from NCBI (http://downloads.asperasoft.com/en/downloads/8?list) OR 
                                (https://www.ncbi.nlm.nih.gov/sra/docs/submitfiles/#aspera-connect)
   2. Uncompressed the downloaded file "tar -zxvf ibm-aspera-connect-3.9.7.175481-linux-g2.12-64.tar.gz"
   3. Install Aspera (sh ibm-aspera-connect-3.9.7.175481-linux-g2.12-64.sh)
## prepreparation for data uploading
### BioProject submission portal - part 1/2

Go to the [Submission portal](https://submit.ncbi.nlm.nih.gov/)
Click on `BioProject`
Click on `New submission`
Step 1 Submitter: There shouldn't be any problem, just ask yourself who you are.
Step 2 Project Type: `My Project data` type is "Transcriptome or Gene expression" and my `Sample scope` is "Multiisolate" because I am comparing multiple individuals within the same species.
Step 3 Target: The only required slot is `organism name`.
Step 4 General Info: You will be asked to select a publication date. It could be immediate or as far as 4 years later or upon publication. Then you will have to put as project title and description.
Step 5 BioSample: Here's the fun part! If you are like me, the first time user, you will have to click on `register at BioSample` first then come back to this page later.

### BioSample submission portal

## Upload data with Aspera
~/.aspera/connect/bin/ascp
