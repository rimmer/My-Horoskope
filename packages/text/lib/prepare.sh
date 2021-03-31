#!/bin/bash

# HOW-To
# prepare "PATH_TO_CSV" LOCALE_NAME
# PATH_TO_CSV - csv file with new predictions
# PATH_TO_PREDICTIONS_FILE - lcoale that has a file with predictions bytedata for needed locale
# exmple:
# prepare "some_csv.csv" english

# check arguments
if ! [[ "$#" =~ ^[2]$ ]]; then
    echo "incorrect number of arguments, must be:"
    echo "prepare \"PATH_TO_CSV\" \"PATH_TO_PREDICTIONS_FILE\""
    exit 1
fi

if [[ "$1" != *.csv ]]; then
    echo "first file is not in csv format"
    exit 1
fi


if [ -f "$1" ]; then
    echo "$1 found"
else 
    echo "$1 does not exist."
    exit 1
fi

dartPath="locale/$2/prediction.dart"

if [ -f "$dartPath" ]; then
    echo "$dartPath found"
else 
    echo "$dartPath does not exist."
    exit 1
fi

if grep -q 'List<String> _predictions' "$dartPath"; then
    echo "second file is correct"
else
    echo "second file is not correct"
    exit 1
fi


# read files
csv=$(cat -E "$1" | tr -d '\r\n')
dartFile=$(cat "$dartPath")

# replace end of line with control characters
csv="${csv//$/\\\r\\\n}"
# replace " with control "
csv="${csv//\"/\\\"}"

# add to the file
toAdd="${dartFile/];/\"$csv\",];}"
echo "$toAdd" > "$dartPath"

echo "Predictions are added to $dartPath"