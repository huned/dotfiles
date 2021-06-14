## systemd

Workflow

* create a `*.service` unit in `~/.config/systemd/user/`

      touch ~/.config/systemd/user/example.service
      # edit it

* create a corresponding `*.timer` unit in `~/.config/systemd/user/`

      touch ~/.config/systemd/user/example.timer
      # edit it

* enable both service and timer units

      systemctl --user enable example.timer
      systemctl --user enable example.service

* verify that they're enabled

      systemctl --user list-unit-files

* test out the service unit by starting it manually

      # in one terminal, watch the logs
      journalctl --user -xef

      # in another terminal, start the service
      systemctl --user start example.service

* see failed units

      systemctl --user --failed

* see an installed unit's status

      systemctl --user status example.service
      systemctl --user status example.timer

* after editing units, reload/restart

    systemctl --user daemon-reload
    systemctl --user reload-or-restart example.timer
    systemctl --user reload-or-restart example.service

#### Troubleshooting

* Sometimes the timers will get stuck in "trigger: n/a" state. It may be necessary to stop the corresponding service unit, then restart the timer unit.

      systemctl --user stop example.service
      systemctl --user stop example.timer
      systemctl --user start example.timer
