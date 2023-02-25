#!/bin/bash

# The script generates the Dart code for the sdk version: '>=2.17.6 <3.0.0'
# The script is very fragile, be sure to follow YAML syntax.

TAG_INFO="[INFO]"
TAG_ERROR="[ERROR]"
TAG_WARN="[WARN]"
TAG_DEP="[DEP]"

COLOR_RED='\033[0;31m'
COLOR_CYAN='\033[0;36m'
COLOR_ORANGE='\033[0;33m'
COLOR='\033[0m'

INPUT=$1;
OUTPUT=$2;

POSTFIX="Pubspec"
CLASS="class"
SPACE=" "
EQUALS="="
OPEN="{"
CLOSE="}"
NEXT=""
END=";"
STRING="String$SPACE"
MAP="Map<String,dynamic>$SPACE"
CONST="const$SPACE"
STATIC="static$SPACE"
SEP=":"
QUOTE="'"
TRUE="true"
COMMA=","

function to_string() {
  echo "$QUOTE$1$QUOTE"
}

function to_lower_camel_case() {
  echo "$1" | sed -e 's/\(.*\)/\L\1/' | sed -r 's/(_)([a-z])/\U\2/g'
}

function trim() {
  echo -e "$1" | sed -e 's/^[[:space:]]*//'
}

# Pubspec.
FIELD_SEP=":"
FIELD="[a-zA-Za].*$FIELD_SEP"
FIELD_NAME="name$FIELD_SEP"
FIELD_INDENT="  "

# By default it contains the default class name, if it is missing.
# Contains ready-made Dart code - a class with metadata.
gen_code="$CLASS$SPACE$POSTFIX$OPEN$NEXT"
INIT_CODE=$gen_code$CLOSE

# Messages.
DEPENDENCY="$TAG_DEP The script requires the following tools: touch, cat, sed, printf"
ERROR_INPUT="$COLOR_RED$TAG_ERROR$COLOR Specify the input file as the first argument \n"
ERROR_OUTPUT="$COLOR_RED$TAG_ERROR$COLOR Specify the output file as the second argument \n"
INFO_FILE_CREATED="$COLOR_CYAN$TAG_INFO$COLOR Output file \"$OUTPUT\" was created \n"
ERROR_FILE_CREATED="$COLOR_RED$TAG_ERROR$COLOR Unable to create output file \"$OUTPUT\" \n$COLOR_RED$TAG_ERROR$COLOR \"touch $OUTPUT\" was not able to create the file\n"
INFO_OUTPUT_FORMATTED="$COLOR_CYAN$TAG_INFO$COLOR Input data formatted for processing \n"
ERROR_OUTPUT_FORMATTED="$COLOR_RED$TAG_ERROR$COLOR Unable to process input data \n$COLOR_RED$TAG_ERROR$COLOR \"cat $OUTPUT\" returned the emptiness \n"
INFO_OUTPUT_GEN="$COLOR_CYAN$TAG_INFO$COLOR Class with data generated \n"
WARN_OUTPUT_GEN="$COLOR_ORANGE$TAG_WARN$COLOR Incorrect input data \n$COLOR_ORANGE$TAG_WARN$COLOR Check the integrity of the input file \n"

if ! command -v touch &> /dev/null; then echo "$DEPENDENCY"; exit; fi
if ! command -v cat &> /dev/null; then echo "$DEPENDENCY"; exit; fi
if ! command -v sed &> /dev/null; then echo "$DEPENDENCY"; exit; fi
if ! command -v printf &> /dev/null; then echo "$DEPENDENCY"; exit; fi

[ "$1" == "" ] && printf "$ERROR_INPUT" && exit
[ "$2" == "" ] && printf "$ERROR_OUTPUT" && exit

{ touch $OUTPUT; } &> /dev/null
[ -e $OUTPUT ] && printf "$INFO_FILE_CREATED"
[ ! -e $OUTPUT ] && printf "$ERROR_FILE_CREATED" && exit

# Clear the previously created file.
{ echo "" > $OUTPUT; } &> /dev/null

# Formatting for further processing.
while IFS= read -r line; do
  # Continue, if this is a commentary.
  if [[ $line =~ \#.* ]]; then continue;  fi

  # Continue, if this is a empty.
  if [[ "$line" == "" ]]; then continue; fi

  if [[ $line =~ ^$FIELD\ .* ]]; then
    # Continue, if it is a field, no action is required.
    { echo -e "$line" >> $OUTPUT; } &> /dev/null; continue
  fi

  if [[ $line =~ ^$FIELD ]]; then
    # Add a string before the array to adequately define the type.
    { echo -e "\n$line" >> $OUTPUT; } &> /dev/null; continue
  fi

  { echo -e "$line" >> $OUTPUT; } &> /dev/null
done < "$INPUT"

[ "$(cat $OUTPUT)" != "" ] && printf "$INFO_OUTPUT_FORMATTED"
[ "$(cat $OUTPUT)" == "" ] && printf "$ERROR_OUTPUT_FORMATTED" && exit

# Imitation type, to determine the type
# of the last string or what it is.
TYPE_ANY=0
TYPE_CLASS=1
TYPE_FIELD=2
TYPE_FIELD_MAP=3
TYPE_MAP_FIELD=4
TYPE_END=5

type=$TYPE_ANY
while IFS= read -r line; do
  if [[ $line =~ $FIELD_NAME\ [a-zA-Za] ]]; then
    # If the line is a name field, update the name of the class.
    line=${line//$FIELD_NAME /}
    gen_code=${gen_code//$POSTFIX/${line^}$POSTFIX}
    type=$TYPE_CLASS; continue
  fi

  if [[ $line =~ ^$FIELD\ .* ]]; then
    # What fits on one line and what does not look like an array
    # will be added to the Dart code as a field with the type string.
    var_name=$(to_lower_camel_case "${line//$FIELD_SEP ?*/}")
    var_value=$(to_string "${line//?*$FIELD_SEP /}")
    # Correcting a string in a string.
    var_value=${var_value//$QUOTE$QUOTE/$QUOTE}
    gen_code+="$STATIC$CONST$STRING$var_name$EQUALS$var_value$END$NEXT"
    type=$TYPE_FIELD; continue
  fi

  if [[ $line =~ ^$FIELD ]]; then
    # If the field does not contain a value in the line,
    # it is an array and create the beginning of the map for Dart code.
    var_trim=$(trim "$line")
    var_name=$(to_lower_camel_case "${var_trim//$FIELD_SEP/}")
    gen_code+="$NEXT$STATIC$CONST$MAP$var_name$EQUALS$OPEN$NEXT"
    type=$TYPE_FIELD_MAP; continue
  fi

  if [[ $line =~ $FIELD_INDENT$FIELD ]]; then
    var_name=$(to_lower_camel_case "${line//$FIELD_SEP ?*/}")
    var_name=$(trim "$var_name"); var_name=$(to_string "$var_name")

    # Some fields have no value, but exist, will think bool type.
    var_value=$TRUE; if [[ $line =~ $FIELD\ .* ]]; then
      # If the field has a value, get.
      var_value=$(to_string "${line//?*$FIELD_SEP /}")
      # Correcting a string in a string.
      var_value=${var_value//$QUOTE$QUOTE/$QUOTE}
    fi

    gen_code+="$var_name$SEP$var_value$COMMA$NEXT"
    type=$TYPE_MAP_FIELD; continue
  fi

  if [ $type == $TYPE_MAP_FIELD ]; then
    # Close a map.
    gen_code+=$CLOSE$END$NEXT
    type=$TYPE_END
  fi
done < "$OUTPUT"

if [ $type == $TYPE_MAP_FIELD ]; then
  # Close the last map.
  gen_code+=$CLOSE$END$NEXT
fi

gen_code+=$CLOSE # Close the class.

if [[ ${#gen_code} > ${#INIT_CODE} ]]
  then printf "$INFO_OUTPUT_GEN"
  else printf "$WARN_OUTPUT_GEN" # Message Warn
fi

{ echo -e "/// Don't change this file or class, it's generated! Contains data from pubspec.yaml." > $OUTPUT; } &> /dev/null
{ echo -e "/// * The usual fields are the name from the config and the [String] type." >> $OUTPUT; } &> /dev/null
{ echo -e "/// * Arrays and the like are maps with a [String] key and a [dynamic] value." >> $OUTPUT; } &> /dev/null
{ echo -e "/// * All keys try to have a [String] value, the exception is a key without a value, it will have a [bool] value." >> $OUTPUT; } &> /dev/null
{ echo -e $gen_code >> $OUTPUT; } &> /dev/null
