#!/bin/bash
# DESCRIPTION
#    Paths to dependencies for longread-UMI-pipeline 
#
# IMPLEMENTATION
#    author	S�ren Karst (sorenkarst@gmail.com)
#               Ryans Ziels (ziels@mail.ubc.ca)
#    license	GNU General Public License

# Program paths

export SEQTK=/srv/MA/users/smk/software/seqtk/seqtk
export GNUPARALLEL=/home/bio.aau.dk/smk/bin/parallel
export RACON=/srv/MA/users/smk/software/racon/build/bin/racon
export MINIMAP2=/home/bio.aau.dk/smk/bin/minimap2
export GAWK=/usr/bin/gawk
export SAMTOOLS=/home/bio.aau.dk/smk/bin/samtools
export BCFTOOLS=/home/bio.aau.dk/smk/bin/bcftools
export MEDAKA_ENV_START='eval "$(conda shell.bash hook)"; conda activate medaka'
export MEDAKA_ENV_STOP='conda deactivate'
export CUTADAPT=/home/bio.aau.dk/smk/.local/bin/cutadapt
export PORECHOP_UMI=/srv/MA/users/smk/software/Porechop/porechop-runner.py
export FILTLONG=/srv/MA/users/smk/software/Filtlong/bin/filtlong
export BWA=/srv/MA/users/smk/software/bwa/bwa
export USEARCH=/srv/MA/users/smk/software/usearch/usearch11.0.667_i86linux32

# longread_umi paths
export REF_CURATED=$LONGREAD_UMI_PATH/scripts/zymo-ref-uniq_2019-10-28.fa
export REF_VENDOR=$LONGREAD_UMI_PATH/scripts/zymo-ref-uniq_vendor.fa
export BARCODES=$LONGREAD_UMI_PATH/scripts/barcodes.tsv

# Version dump
longread_umi_version_dump (){
  local OUT=${1:-./longread_umi_version_dump.txt}

  echo "Script start: $(date +%Y-%m-%d-%T)"  >> $OUT
  echo "Software Version:" >> $OUT
  echo "longread_umi - $(git --git-dir ${LONGREAD_UMI_PATH}/.git describe --tag)" >> $OUT
  echo "seqtk - $($SEQTK 2>&1 >/dev/null | grep 'Version')" >> $OUT 
  echo "Parallel - $($GNUPARALLEL --version | head -n 1)" >> $OUT 
  echo "Usearch - $($USEARCH --version)" >> $OUT 
  echo "Racon - $($RACON --version)" >> $OUT
  echo "Minimap2 - $($MINIMAP2 --version)" >> $OUT
  echo "medaka - $(eval $MEDAKA_ENV_START; medaka --version | cut -d" " -f2; eval $MEDAKA_ENV_STOP)"  >> $OUT
  echo "medaka model - ${MEDAKA_MODEL##*/}"  >> $OUT
  echo "Gawk - $($GAWK --version | head -n 1)" >> $OUT 
  echo "Cutadapt - $($CUTADAPT --version | head -n 1)" >> $OUT 
  echo "Porechop - $($PORECHOP_UMI --version) + add UMI adaptors to adaptors.py" >> $OUT 
  echo "Filtlong - $($FILTLONG --version)" >> $OUT
  echo "BWA - $($BWA 2>&1 >/dev/null | grep 'Version')" >> $OUT
  echo "Samtools - $($SAMTOOLS 2>&1 >/dev/null | grep 'Version')" >> $OUT
  echo "Bcftools - $($BCFTOOLS --version | head -n 1)" >> $OUT
}

### Version dump
# source dependencies.sh
# ncec_version_dump
