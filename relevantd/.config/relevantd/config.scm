(relevantd
  (socket-dir 'user-dir)
  (display [show-duration: '5s
            refresh-interval: '500ms])
  (cues
    (cue 'music
         [kind: 'shell
          description: "current song from playerctl"
          default-value: "nothing playing"
          trigger: (on-interval '1s)
          interrupt: [enabled: true
                      duration: '2s]
          color: '#cc241d
          command: 'bash
          args: '("-c"
                  (string-append "echo -n "
                                 "$(playerctl "
                                 "--player=playerctld metadata "
                                 "--format '{{ lc(status) }}: {{ artist }} - {{ title }}')"))]})))
