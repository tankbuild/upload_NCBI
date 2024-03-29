# SRA NCBI submission
## Download and install Aspera
   1. download Aspera from NCBI (http://downloads.asperasoft.com/en/downloads/8?list) OR 
                                (https://www.ncbi.nlm.nih.gov/sra/docs/submitfiles/#aspera-connect)
   2. Uncompressed the downloaded file "tar -zxvf ibm-aspera-connect-3.9.7.175481-linux-g2.12-64.tar.gz"
   3. Install Aspera (sh ibm-aspera-connect-3.9.7.175481-linux-g2.12-64.sh)
## Upload RAD-seq data
   **For submit RAD-seq data, we should submit the demultplexed Reads. And remember! each individual should have its own          Biosample**
## Answer from NLM support (nlm-support@nlm.nih.gov)
   A BioProject is a description of a sequencing study. This definition is intentionally vague so that the SRA can accommodate a variety of submission types (including single and multi-method studies) and user needs. You can submit all of this data under one BioProject or three dependent on your needs.

The SRA requests that data be demultiplexed to sample whenever possible. Because only a single BioSample can be linked to a sequence file the sequences should be demultiplexed. If this is not possible, then please create a BioSample that adequately describes your pooled data, and provide a description on how to demultiplex your reads.
## Pre-preparation for data uploading
### BioProject submission portal - part 1/2
Go to the [Submission portal](https://submit.ncbi.nlm.nih.gov/)

Input `BioProjects & BioSamples`

Click on `New submission`

Step 1 Submitter: There shouldn't be any problem, just ask yourself who you are.

Step 2 Project Type: `My Project data` type is "Transcriptome or Gene expression" and my `Sample scope` is "Multiisolate" because I am comparing multiple individuals within the same species.

Step 3 Target: The only required slot is `organism name`.

Step 4 General Info: You will be asked to select a publication date. It could be immediate or as far as 4 years later or upon publication. Then you will have to put as project title and description.

Step 5 BioSample: Here's the fun part! If you are like me, the first time user, you will have to click on `register at BioSample` first then come back to this page later.

### BioSample submission portal
`**Please Note**: If you have multiple samples to submit, then complete the Bioproject without registering Biosample, then submit Biosample in batch` at [Submission Portal](https://submit.ncbi.nlm.nih.gov/subs/biosample/)

Now you have been automatcally directed to BioSample submission.

Step 1 General Information: Again, here you can select a publication date.

Step 2 Sample Type: Mine is "Model organism or animal sample".

Step 3 Attributes: Now you are asked to type in every teeny-tiny detail of your sample.

Step 4 Title and Comments: No comments.

Step 5 Overview.

Shortly after you hit `submit`, you will receive your `sample_name` in the form of SAMN# in your email or you can check it later on the BioSample submission portal.

Now, you can go back to `BioProject` by clicking on `Submission Portal` on the upper left corner:

Then, select `BioProject`:

### BioProject submission portal - part 2/2
Step 6 Publication: Link any existed publication. If not, go to next step.

Step 7 Overview: If everything looks great, hit `submit`. Again, you will receive your `biosample_accession` in the form of PRJNA# in your email or you can check it later on the BioProject submission portal.

## Upload data with Aspera
Hooray! Now we have both `biosample_accession(PRJNA#)` and `sample_name(SAMN#)`. Let's get down to the business.

Go to SRA [submission portal](https://submit.ncbi.nlm.nih.gov/subs/sra/).

Hit `New submission`.

Step 1 Submitter: yadi yadi yada.

Step 2 General Information: Now you already have BioProject, remember to put the project number in the `Existing BioProject` area.

Step 3 SRA metadata: FINALLY, we got to the point where I was stuck previously. Now you need to put every library prep in it. I suggest to download the spreadsheet, fill it out, then save as `Tab Delimited Text (.txt)` later. `Click Download Excel spreadsheet`: 

In the spreadsheet, there are detailed explanations for every column.

Of notice, if you are dealing with paired-end reads, please put paired reads in the same row but use `filename` and `filename2` to separate out two files. The `filename` needs to be exactly the same (including file extension) as the sequence files that you are going to upload later, e.g. `t1.control_1_I23_GAGTGG_R1_combined.fastq.gz`.

Once you've finished it, stay on the same sheet then click `save as`. Set `File Format` as `Tab Delimited Text (.txt)`: 

Then hit `Save Active Sheet` because you only need `SRA_metadata` but not other sheets such as `Contact Info and Instructions` and `Library and Platform Terms`.

Step 4 Files: If your files are small, click on `I will upload all the files now via HTTP/Aspera` and start to upload your files. If you are like me, my file is over 10GB, then you need to `preload` the files. At this point, you will have click on the purple `Sequence Read Archive (SRA)` to go back to [the front page of Sequence Read Archive (SRA)](https://submit.ncbi.nlm.nih.gov/subs/sra/): 

My files are stored on supercomputer and I am not going to download them to local computer then upload them through FTP. It's a waste of time. So I am going to directy upload them through command line in my supercomputer. On the front page, click on `command line upload` and ask for preload folder. Once you have a preload folder, your front page will look like this: 

Click on `Aspera command line upload`, you will see the following instructions:

The red block is the email used in your NCBI account.

The blue block is a random_code generated by NCBI.

`The orange rectangle is a where to download your key file`. You can put your key file in the same folder with all fastq files to facilitate the following upload. Simply right click mouse on `key file` and select `Copy Link Address`. Log in to the supercomputer linux system, naviagate to the folder where you stored your sequence data, and type `wget <the link you copied>`. It will download your key file to the current folder.

First, you need to install Aspera on your supercomuter. Second, make sure all your fastq files (they can be compressed using gzip or bzip2), in my case, gz files along with the key file are in the same folder.
Third, upload everything in your folder via Aspera. My command is:
```
~/.aspera/connect/bin/ascp(OR /tools/aspera/bin/ascp OR /usr/local/bioinfo/src/Aspera/aspera-connect-3.5.1/bin/ascp) -i <path/to/key_file> -QT -l10000m -k1 -d <path/to/file(s)> subasp@upload.ncbi.nlm.nih.gov:uploads/NCBI_account_email_<random_code>/<submission_folder>/
```

I use `~/.aspera/connect/bin/ascp` is because my aspera is installed in the `~/.aspera` folder. If your aspera is pre-installed on the system, just type `ascp`.

`<random_code>`: A random code for upload is provided by NCBI.

`<path/to/key_file>`: key file is provided by NCBI. Download it and save to the same folder where you put all the sequence files. It must be an absolute path, e.g.: `/home/keys/aspera.openssh`.

`<path/to/file(s)>`: An absolute path to your sequencing files on the supercomputer.

`<submission_folder>`: Name it as you want. It is required and will be created automatically.

Once you have uploaded your file successfully. Go back to the SRA submission portal Step 4 Files and select the preload folder. It will have the same name as you specified in <submission_folder> earlier.

Step 5 Overview: Congratulations! You have successfully uploaded your data to `SRA` and created `Bioproject` and `BioSample`.

I can believe this whole process took me 3 days. I hope this tutorial can save your time and make your life easier.

Useful(?) links:

[SRA Submission Quick Start](https://www.ncbi.nlm.nih.gov/sra/docs/submit/)

[Troubleshooting SRA submission](https://www.ncbi.nlm.nih.gov/sra/docs/submitquestions/#question5sp)

[SRA Metadata and Submission Overview](https://www.ncbi.nlm.nih.gov/sra/docs/submitmeta/)
