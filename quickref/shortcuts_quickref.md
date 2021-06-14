
## Keyboard Shortcuts

| Category        | Action                              | Current Shortcut | Ideal Shortcut |
| --------------- | ----------------------------------- | ---------------- | -------------- |
| Moving windows  |                                     |                  |                |
|                 | **Toggle tile left**                | **CMD+Left**     |                |
|                 | **Toggle tile right**               | **CMD+Right**    |                |
|                 | Toggle maximized                    | CMD+Up           |                |
|                 | Toggle full screen                  | CMD+F            |                |
|                 | Toggle maximized vertically         | CTRL+CMD+Up      |                |
|                 | Center window                       | CMD+Return       |                |
|                 | **Hide window**                     | **CMD+H**        |                |
| Task switching  |                                     |                  |                |
|                 | See all windows (current workspace) | CMD+S            |                |
|                 | See all windows (all workspaces)    | CMD+A            |                |
|                 | **Cycle windows (forward)**         | **CMD+TAB**      |                |
|                 | Cycle windows (backward)            | SHIFT+CMD+TAB    |                |
|                 | Cycle windows (current application) | ?                | CMD+`          |
|                 | **Close window**                    | **CMD+W**        | None?          |
|                 | **Close tab**                       | **CTRL+W**       | CMD+W          |
|                 | **Exit program**                    | **CTRL+Q**       | CMD+Q          |
| Workspaces      |                                     |                  |                |
|                 | Move window to workspace left       | ALT+CMD+L        |                |
|                 | Move window to workspace right      | ALT+CMD+R        |                |
|                 | Cycle workspace left                | CMD+L            |                |
|                 | Cycle workspace right               | CMD+R            |                |
|                 | Go to workspace                     | CMD+<number>     |                |
|                 | See all workspaces                  | CMD+DOWN         |                |
| Copy/Paste      |                                     |                  |                |
|                 | Copy                                | CTRL+C           | CMD+C          |
|                 | Cut                                 | CTRL+X           | CMD+X          |
|                 | Paste                               | CTRL+V           | CMD+V          |
| Screen Captures |                                     |                  |                |
|                 | Grab full screen                    | CMD+CTRL+3       | CMD+SHIFT+3    |
|                 | Grab area                           | CMD+CTRL+4       | CMD+SHIFT+4    |
|                 | Grab current window                 | CMD+CTRL+5       | CMD+SHIFT+5    |
| Other           |                                     |                  |                |
|                 | Lock screen                         | CMD+L            |                |

Questions:

  * How do I get consistent copy/paste in Atom w/ vim-mode-plus?
  * There's some *yucky* inconsistency between use of CMD and CTRL.
    Applications use CTRL (mostly) while the window manager/gnome desktop uses
    CMD. I would prefer to standardize on just ONE super-key type of shortcut.

Applications honor specific CTRL (or CMD?) shortcuts:

  * Chromium
  * Terminal
  * Atom
  * ElementaryOS
    * Files (File Manager)
    * Document Viewer (PDF Viewer)
    * Pictures (Image Viewer)

See also dconf:

  * /org/gnome/shell/keybindings/
  * /org/gnome/desktop/wm/keybindings/
  * /org/gnome/mutter/keybindings/
  * /org/pantheon/desktop/gala/keybindings/
