# Usage: ./trainModels dataDirectory outputDirectory

dataDir="$1" #consists data files generated for each category (BOW data like [wordIndex]:[count])
outDir="$2" #output directory in which training models will be created
latentVariables=40

for i in `find $dataDir/* -maxdepth 1 -iname "*.data"`
do
    data="${i##*/}"
    category="${data%%.*}"
    ./lda-0.2/lda -N $latentVariables "$i" "$outDir/$category"
done


