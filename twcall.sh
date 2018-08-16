#!/bin/bash
## defult to change gbk to utf8 in commands

TwCallVersion="0.0.1"
if [ $# -ne 0  ]; then
  if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "NAME"
    echo "  twcall - taiwanese want to call (traditional chinese)"
    echo "  Usage: twcall [Command(GBK)] [Text(GBK)]..."
    echo ""
    echo "OPTIONS:"
    echo "  -h, --help"
    echo "      show help data about twcall cammands"
    echo ""
    echo "  -a, --author"
    echo "      show twcall author and gittub"
    echo ""
    echo "  -v, --version"
    echo "      show twcall vision"
    echo ""
  elif [ "$1" == "-a" ] || [ "$1" == "--author" ]; then
    echo "twcall author: lian0123"
  elif [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
    echo "twcall version : $TwCallVersion"
  else
    >~/twcall/.twcall.tmp
    echo "$@">>~/twcall/.twcall.tmp

    if [ "$1" == "cd" ]; then
      echo "exec bash">>~/twcall/.twcall.tmp
    fi

    iconv -f utf8 -t gbk ~/twcall/.twcall.tmp -o ~/twcall/.twcall.tmp
    iconv -f big5 -t utf8 ~/twcall/.twcall.tmp -o ~/twcall/.twcall.tmp
    cat ~/twcall/.twcall.tmp
    printf "確定執行以下動作：(y/n)"
    read ToDoCommand
    if [ "$ToDoCommand" == "N" ] || [ "$ToDoCommand" == "n" ];then
      exit -1
    else
      bash ~/twcall/.twcall.tmp
    fi
  fi
else
  echo "Error: Please Input Commands......"
fi

