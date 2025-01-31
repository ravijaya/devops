#! /bin/bash

OPTN=${1}
NUMOPTNMX=2

printUsage() {

  cat <<EOF
 Usage: $(basename $0) <create|show|delete>
EOF
  exit 0

}

parseArgs() {

  if [[ $# -gt ${NUMOPTNMX} ]]
  then
    printUsage
  fi

  if [[ "${OPTN}" != "create" ]] && \
     [[ "${OPTN}" != "show"   ]] && \
     [[ "${OPTN}" != "delete" ]]
  then
    printUsage
  fi
}

main() {

  parseArgs

  if [[ "${OPTN}" = "create" ]]
  then
    footloose create -c /tmp/footloose.yaml
    while true
    do
      sleep 10
    done
  elif [[ "${OPTN}" = "show" ]]
  then
    footloose show -c /tmp/footloose.yaml
  elif [[ "${OPTN}" = "delete" ]]
  then
    footloose delete -c /tmp/footloose.yaml
  fi

}

main 2>&1
