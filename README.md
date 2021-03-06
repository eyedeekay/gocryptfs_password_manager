# gocryptfs_password_manager
Dead-simple password manager for users using gocryptfs and normal files.
Designed to be used for safer, more convenient scripted logins.

## warning:

This is intended for UNIX desktops operated by a single human administrator.
People who can view the process filesystem, either for your user or in it's
entirity, are capable of breaking the security of this system by viewing the
command used to launch a process using these passwords. However, the window of
time that the password is visible is limited to the time it takes for curl to
complete a single request. If at all possible, share the secret with another
program through environment variables and combine with a security module or
patchset capable of hiding a user's processes from another user.

## usage:

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
            -file: Show the file containing the requested password.
            -u: Forcibly unmount the encrypted volume.
            -c: Set the environment variables to blank.
            -panic: Unmount and securely delete all encrypted volumes,
                mountpoints, and recovery keys.

### examples:

**Initialize a passsword store**

        gpm -init

**Change the master password**

        gpm -passwd

**Add a password**

        gpm -add $sitenickname $username $password
        gpm -add github user pass

**Delete a password**

        gpm -del $sitenickname
        gpm -del github

**Emit a username and password to stdout(They can be sourced into scripts)**

        gpm -del $sitenickname
        gpm -del github

**Change a site passsword**

        gpm -change $sitenickname $username $password
        gpm -change github user pass

**Shred the password store completely(Dangerous)**

        gpm -panic

## usage in scripts:

        . <(gpm -emit "$site")

or

        . <(gpm-emit "$site")

will source the password into your environment.

        . <(gpm -c)

or

        . <(gpm-c)

will clear the variables containing the password. *Make sure to call this*
*before the end of your script*.

## example script:

        #! /usr/bin/env sh
        . <(gpm -emit github)
        cookieget https://github.com/login
        uzbl https://github.com/ &
        . <(gpm-c)

### more scripts:

  * [Skinnydip](https://github.com/eyedeekay/skinnydip)
