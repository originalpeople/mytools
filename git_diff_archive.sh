function git_diff_archive() 
{
    dateTime=`date '+%Y%m%d%H%M'`
    local diff=""
    local h="HEAD"
    if [ $# -eq 1 ]; then
        if expr "$1" : '[0-9]*' > /dev/null ; then
            diff="HEAD HEAD~${1}"
        else
            diff="HEAD ${1}"
        fi
    elif [ $# -eq 2 ]; then
        diff="${1} ${2}"
        h=$1
    fi
    if [ "$diff" != "" ]; then
        diff="git diff --name-only ${diff}"
    fi
    git archive --format=zip $h `eval $diff` -o ${PWD##*/}-$dateTime.zip
}
