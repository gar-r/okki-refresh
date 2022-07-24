# okki-refresh

## What is okki-refresh?

okki-refresh is a companion utility for the [okki-status](https://git.okki.hu/garric/okki-status) status bar.
`okki-refresh` does not work without `okki-status`, so please get familiar with it first.

## Installation

### Building the binary

Make sure, that you have Go (version 1.15 or above) installed on your system.

1. clone or download the source code
2. switch to the source directory
3. build: `make build`
4. install: `sudo make clean install`

Install will add the following binary to your system:

```
/usr/local/bin/okki-refresh
```

## Using okki-refresh

`okki-refresh` can take one or more block names as command line argument and will send a signal to `okki-status` to immediately refresh them. For example, in order to refresh the blocks named `brightness` and `volume`, you would call `okki-refresh` with the following arguments:

```
okki-refresh brightness volume
```

This will force the blocks with matching _name_ to refresh immediately, and the status bar will also redraw them. Other modules will not refresh, avoiding unneccessary system calls.

## Examples

### Reacting to multimedia keys

#### dwm example

```
## config.h (dwm source file)
static Key keys[] = {
   { 0, XF86XK_MonBrightnessUp, spawn, SHCMD("brillo -A 10; okki-refresh brightness") },
}
```

#### sway example

```
set $refresh "/usr/local/bin/okki-refresh"
bindsym XF86MonBrightnessUp exec $brightness up 1; exec $refresh brightness
```

All other multimedia keys can be configured in a similar fashion with the appropriate key-codes and module names.

### Pacman hook

If you are using the `updates` module with `pacman`, you can set up a hook to refresh the module after each package upgrade (on Arch: `/etc/pacman.d/hooks/okki-status.hook`):

```
[Trigger]
Operation=Upgrade
Type=Package
Target=*

[Action]
Exec=/usr/local/bin/okki-refresh updates
When=PostTransaction
```
