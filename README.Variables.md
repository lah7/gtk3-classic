# Environment Variables

## Where to set

To set them globally, either:

- `/etc/environment` for all users, all apps.
- `~/.bash_profile` or `~/.bashrc` or `~/.bash_aliases` (on some distros) for the current user, all apps.

For individual apps:

- Edit the application launcher and prepend them to the command.

To test them temporarially from the terminal:

    env GTK_CSD=0 gnome-disk-utility

To remove the value:

    unset GTK_CSD


## Available options


| Env                   | By default, when unset    | When set                |
| --------------------- | ------------------------- | ----------------------- |
| `GTK_CSD=0`           | Disable CSDs (X11 only)   | Normal GTK behaviour. Use CSDs if application requests them.
| `GTK_CSD=1`           | Disable CSDs (X11 only)  | Force CSD or enable client shadow.
| `GTK_USE_IEC_UNITS=1` | Use SI units (1000 bytes, 2 MB) in the file chooser (GTK default) | Use IEC units (1024 bytes, 2 MiB) in the file chooser
| `GTK_BACKDROP=1`      | Inactive windows controls don't change | Inactive window controls dim (GTK 3 behaviour)
| `GTK_OVERLAY_SCROLLING=1` | Always show the scroll bar | Use overlay scrolling (GTK 3 default)
| `GTKM_INSERT_EMOJI=1` | Hide "Insert Emoji" option in text fields | Show this menu option (GTK 3 behaviour)
| `GTK_NO_TAB_SCROLL=1` | Use the scroll wheel to scroll over tabs (GTK 2 behaviour) | Up to each application to implement (GTK 3 behaviour)
| `GTK_RELAX_RGBA=1`    |                           | Allows windows to be transparent whenever a compositor is enabled.
