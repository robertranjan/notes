1. How to copy 300 lines from currnt pane?
    Note: Session has Windows, Windows has Panes
    Syntax:
      Prefix : capture-pane -S -NNN
      Prefix : capture-pane -S -      ; no number after - means, capture all from current pane
    Example:
      C-a: capture-pane -S -

   1.1 how to save copied text[buffer] to a file?
      Syntax:
        Prefix : save-buffer <filename>
      Example:
        C-a:save-buffer my-buffer.txt

2. tmux logging.
    prefix + P        ; toggles pane logging. Output is cleared from unwanted ANSI characters!
    prefix + Alt + P  ; saves complete pane history to a file
    Read more here - https://github.com/tmux-plugins/tmux-logging

3. How to start multiple ssh sessions with tmux?
   3.1 Solution: 1
      Knowledge source: https://gist.github.com/dmytro/3984680
      Pre-requisite:
        sqlite3 installed with a db: ~/Personal/password-databases/sqlite/test.db
          Tables: hosts

      Source below through .bashrc/.profile and try [ starttmux ]
        isEnvAvailable() {
          env=$1
          if [[ " env1 env2 env3 env4 envN " ==  *"$env"* ]] ; then
            printf "0" # env exist
          else
            printf "1" # env NOT exist
          fi
        }

        isAppAvailable() {
          app=$1
          if [[ " app1 app2 app3 app4 appN " ==  *"$app"* ]] ; then
            printf "0" # app exist
          else
            printf "1" # app NOT exist
          fi
        }

        # For tmux lovers
        starttmux() {
          app=$1
          env=$2
          syntax="\e[31msyntax: starttmux <applicaitonName> <env>\n\e[0m"
          if [ -z "$env" -o -z "$app" ] ; then
            printf  "$syntax"
            return 1
          fi
          #isApp=$(isAppAvailable "$app")
          if [ "$isApp" == "1" ] ; then
            printf "\e[31mWrong APPNAME: $app\e[0m\n$syntax"
            return 1
          fi
          #isEnv=$(isEnvAvailable "$env")
          if [ "$isEnv" == "1" ] ; then
            printf "\e[31mWrong ENVNAME: $env\e[0m\n$syntax"
            return 1
          fi
          HOSTS="$(sqlite3 ~/Personal/password-databases/sqlite/test.db "select hostname from hosts where alias like '$app%$env';" | xargs)"
          export HOSTS=$HOSTS
          #sqlite3 ~/Personal/password-databases/sqlite/test.db "select hostname from hosts where alias like 'atr%';"
          if [ -z "$HOSTS" ]; then
            #HOSTS=$(devopsCli getHosts -a $app -e $env)
            #echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
            #read HOSTS
            printf "\e[31mHOSTS=[$HOSTS]\n\t$syntax"
            return
          else
            echo "Creating tmux session to hosts: $HOSTS"
          fi

          local hosts=( $HOSTS )
          #session_name="${hosts[0]}"
          #printf "host list:%s\n" "${hosts[@]}"
          tmux ls
          tmux_server_status=$?
          if [[ $tmux_server_status != 0 ]] ; then
            tmux new-session -d
          fi
          tmux new-window "ssh ${hosts[0]}"
          unset hosts[0];
          for i in "${hosts[@]}"; do
              tmux split-window -h  "ssh $i"
              tmux select-layout tiled > /dev/null
          done
          tmux select-pane -t 0
          tmux set-window-option synchronize-panes on > /dev/null
          tmux attach-session ${hosts[0]}
        }
   3.1 Solution: 2
        Add below function to .bashrc/.profile, source .bashrc/.profile and try [ starttmux ] atr cli.
        starttmux() {
          alias=$1
          echo "Received alias: #$alias#"
          syntax="\e[31msyntax: starttmux <alias name>\n\tEx: \tstarttmux drep.dev \n\t\tstarttmux red.prod\n\tTry starttmux <tab><tab>\n\e[0m"
          if [ -z "$1" ] ; then
            printf  "$syntax"
            return 1
          fi
          # using ansible to get the hostlist. you may need to give inventory path with -i option in the command.
          HOSTS="$(ansible $alias --list-hosts | grep -v '  hosts' | xargs )"
          export HOSTS=$HOSTS
          if [ -z "$HOSTS" ]; then
            printf "\e[31mHOSTS=[$HOSTS]\n\t$syntax"
            return
          else
            echo "Creating tmux session to hosts: $HOSTS"
          fi

          local hosts=( $HOSTS )
          tmux ls
          tmux_server_status=$?
          if [[ $tmux_server_status != 0 ]] ; then
            tmux new-session -d
          fi
          tmux new-window "ssh ${hosts[0]}"
          unset hosts[0];
          for i in "${hosts[@]}"; do
              tmux split-window -h  "ssh $i"
              tmux select-layout tiled > /dev/null
          done
          tmux select-pane -t 0
          tmux set-window-option synchronize-panes on > /dev/null
          tmux attach-session ${hosts[0]}
        }
