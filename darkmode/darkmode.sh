#!/usr/bin/bash
set -a

#
# DARK MODE SCRIPT FOR ELEMENTARYOS 6.x.
#
# HELLA CAVEATS
# - this will only work on ElementaryOS 6.x
# - beware, there's lots of hardcoding/jankiness/bad programming
# - it only works for the set of programs I care about
#
# HOW TO USE IT
# - source this script as part of your ~/.bashrc
#   - you will then have three functions defined:
#     - setDarkMode
#       - valid arguments: "light", "dark", "auto", or no arguments
#       - if no arguments, checks ~/.darkmoderc, which should define
#         a variable DARK_MODE="dark" (or "light" or "auto").
#     - light --> which runs setDarkMode "light"
#     - dark --> which runs setDarkMode "dark"
# - in your terminal/program/whatever, just run light/dark/setDarkMode as
#   needed
#
# TODOs
# - firefox (and user profile?)
# - beekeeper studio (maybe just get rid of this program)
# - dark mode schedule
# - use a file instead of an environment variable so it sticks across shell invocations
#
# LICENSE: MIT
# AUTHOR: Huned Botee (huned@hunedbotee.com)
#

debug() {
  local msg="${1}"

  if [ -n "${DEBUG}" ]; then
    echo "${msg}"
  fi
}

getMode() {
    local rcfile="${HOME}/.darkmoderc"
    local mode

    if [ -f "${rcfile}" ]; then
        #debug "getMode(): Source rc file: ${rcfile}"
        source "${rcfile}"
        #debug "getMode():   DARK_MODE=${DARK_MODE}"
        mode="${DARK_MODE}"
    else
        #debug "getMode(): Didn't find rc file: ${rcfile}"
        #debug "getMode():   Using auto"
        mode="auto"
    fi

    echo -n "${mode}"
}

setDarkMode() {
    local mode="${1}"

    if [ -n "${mode}" ]; then
        debug "setDarkMode(): Requested mode ${mode}"
    else
        debug "setDarkMode(): No mode requested, checking rc file"
        mode=$(getMode)
        debug "setDarkMode():   Requested mode ${mode}"
    fi

    if [ "${mode}" != "light" -a "${mode}" != "dark" -a "${mode}" != "auto" ]; then
      debug "setDarkMode():   Refusing to use invalid mode ${mode}"
      return 0
    fi

    # Trim newline, just to be on the safe side.
    mode=$(echo -n "${mode}")

    # First, update the dark mode state to either "dark", "light", or "auto".
    if [ "${mode}" = "light" ]; then
        true
    elif [ "${mode}" = "dark" ]; then
        true
    elif [[ "${mode}" =~ "auto" ]]; then
        local hr=$(date +%H)
        if [ "$hr" -ge 17 -o "$hr" -lt 7 ]; then
            mode="dark auto"
        else
            mode="light auto"
        fi
    fi

    # Then update application states.
    # TODO separate environment variables from commands because we always
    # want to set env vars when sourcing this script.
    # TODO also want to export the darkmode state into some kinda variable.

    if [[ "${mode}" =~ "dark" ]]; then
        # ElementaryOS appearance (set to "dark")
        gdbus call --system --dest org.freedesktop.Accounts --object-path /org/freedesktop/Accounts/User1000 --method org.freedesktop.DBus.Properties.Set io.elementary.pantheon.AccountsService PrefersColorScheme "<1>" > /dev/null

        # terminal
        gsettings set io.elementary.terminal.settings prefer-dark-style true
        ~/work/forks/gogh/themes/pencil-dark.sh > /dev/null

        # vim
        # then, in vim: ":source ~/.vimrc"
        ln --force -s ~/.config/nvim/init.vim.dark ~/.config/nvim/init.vim

        # batcat
        export BAT_THEME="Monokai Extended"
    else
        # ElementaryOS appearance (set to "no preference" aka default)
        gdbus call --system --dest org.freedesktop.Accounts --object-path /org/freedesktop/Accounts/User1000 --method org.freedesktop.DBus.Properties.Set io.elementary.pantheon.AccountsService PrefersColorScheme "<0>" > /dev/null

        # terminal
        gsettings set io.elementary.terminal.settings prefer-dark-style false
        ~/work/forks/gogh/themes/pencil-light.sh > /dev/null

        # vim
        # then, in vim: ":source ~/.vimrc"
        ln --force -s ~/.config/nvim/init.vim.light ~/.config/nvim/init.vim

        # batcat
        export BAT_THEME="Monokai Extended Light"
    fi

    # If "auto", then enable Elementary's sunset-to-sunrise dark style preference
    if [[ "${mode}" =~ "auto" ]]; then
        gsettings set io.elementary.settings-daemon.prefers-color-scheme prefer-dark-schedule sunset-to-sunrise
    else
        gsettings set io.elementary.settings-daemon.prefers-color-scheme prefer-dark-schedule disabled
    fi

    echo "Dark mode is ${mode}"
}

dark() {
  setDarkMode "dark"
}

light() {
  setDarkMode "light"
}

export -f setDarkMode
export -f dark
export -f light

set +a
