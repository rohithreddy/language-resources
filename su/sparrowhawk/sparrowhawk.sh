#! /bin/bash

set -o errexit
set -o nounset
set -o pipefail

# Tools:
runfiles="${0}.runfiles"
sh_utter="$runfiles/language_resources/utils/sh_utter"
prefix=`pwd`/"$runfiles"/language_resources/su/sparrowhawk/
config=sparrowhawk_configuration.ascii_proto

"$sh_utter" --config="$config"  --prefix="$prefix"

