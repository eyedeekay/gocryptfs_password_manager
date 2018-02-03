# gocryptfs_password_manager
Dead-simple password manager for users using gocryptfs and normal files.
Designed to be used for safer, more convenient scripted logins.

## usage

        gpm
            -check: Make sure that the encrypted folder, mountpoint, and
                recovery folder are set up properly.
            -init: Alias for -check.
            -passwd: Change the master password for the encrypted volume.
            -add $site $username $password: Add a password for a specific
                service.
            -del $site: Delete a password for a specific service.
            -change $site username password: Change a password for a specific
                service.
            -emit $site: Emit a password for a specific service from the store.
            -u: Forcibly unmount the encrypted volume.
            -panic: Unmount and securely delete all encrypted volumes,
                mountpoints, and recovery keys.

## usage in scripts

        . <(gpm -emit "$site")

or

        . <(gpm-emit "$site")

will source the password into your environment.

        . <(gpm -c)

or

        . <(gpm-c)

will clear the variables containing the password. *Make sure to call this*
*before the end of your script*.

## example script

        #! /usr/bin/env sh
