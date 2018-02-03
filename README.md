# gocryptfs_password_manager
Dead-simple password manager for users using gocryptfs and normal files.
Designed to be used for safer, more convenient scripted logins.

## warning:

This is intended for UNIX desktops operated by a single human administrator.
While the purpose of the cookieget script is to hide passwords from ps and
/proc/\*/cmdline, it may only be useful for logging in to https websites. Using
this program without such a wrapper will expose passwords to the process
filesystem and you will be vulnerable to anyone who can view it in an
unrestricted fashion. Please consider combining this with a security solution
which is capable of hiding users processes from eachother.

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
        . <(gpm -emit github)
        cookieget https://github.com
        . <(gpm-c)
