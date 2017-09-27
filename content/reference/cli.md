---
title: Command Line Interface
description: How to use section.io's Command Line Interface. CLI allows you to test your CDN configuration on your local machine.
keywords: content delivery network, CDN, CLI, Command Line Interface, local development, local machine, staging environment
aliases:
  - /cli/

---

The CLI is the primary mechanism for working with a section.io Proxy Stack on your local machine. It will help you provision a local virtual machine configured with the same components as used by section.io for your application in production.

Prerequisites
-------------

### Summary

1.  Install Git, ensure it’s on the PATH.
2.  Install Vagrant, ensure it’s on the PATH.
3.  Install VirtualBox and disable Hyper-V if enabled.

### Detail

The section.io CLI builds upon other great tools to provide the local development experience. During installation above you would have installed Git which the section.io CLI will also use to work with your section.io application’s configuration repository. Ensure the Git install directory has been added to your PATH environment variable.

The CLI also uses Vagrant, an awesome application for managing virtual machines consistently across different platforms. You will need to install Vagrant to use the section.io CLI and it can be downloaded from <https://www.vagrantup.com/>.

The virtual machine that will host your local section.io Proxy Stack has been built for use with the VirtualBox virtualization product, again for its cross-platform support. You can download VirtualBox from <https://www.virtualbox.org/>.

Windows users with Hyper-V enabled will need to disable it to use VirtualBox. Scott Hanselman has a very helpful [article for easily switching between Hyper-V and VirtualBox].

section.io CLI has been implemented in Ruby and should utilise the same version of Ruby used by Vagrant so you should not be required to install Ruby separately.

section.io CLI will send commands to the Vagrant-managed virtual machine via SSH. As SSH is not normally present on Windows, the CLI will try to use version of SSH included with your Git installation. If this fails, you will need to install SSH separately and ensure it is on your PATH.

Installation
------------

1.  **Clone the repository**

    The section.io CLI is currently distributed via a public repository on GitHub. The preferred way to obtain the CLI is to clone the public repository to your local machine. For this you will need Git installed.

    You can download Git for most platforms from <http://git-scm.com/>. If you prefer a graphical interface you might consider [GitHub for Windows], [GitHub for Mac], or [SourceTree] (for both).

    Once you have git installed you can clone the section.io CLI repository using this clone URL:

        https://github.com/section-io/section.cli.git

    For example, using the Git command line, you would clone with the command:

        git clone https://github.com/section-io/section.cli.git

    In this example the repository would be cloned to a section.cli subdirectory under your working directory.

2.  **Add the repository path to your `PATH` environment variable**

    **Note: this step is not absolutely necessary, but makes working with the CLI much simpler.  The rest of this documentation assumes this step has been done.

    *   *Windows*

        1.  Click `WIN+R`
        2.  Enter `systempropertiesadvanced` and click *OK*
        3.  Click on the *Advanced* tab
        4.  Click on *Environment Variables*
        5.  Edit the `PATH` user variable
        6.  Add the path you cloned the repository to (eg `c:\dev\section.cli\`)
        7.  Click *OK* out of the dialog boxes

    *   *Mac*

        1.  Edit the `/etc/paths` file
        2.  Add the path you cloned the repository to on a new line at the end of the file
        3.  Save and close the file

    After adding the CLI to your `PATH` you will need to close and re-open the console to effect the change

3.  **Initialize the local instance of your application**

    Each section.io application you have has a git repository containing all its configuration files, choose a location on your machine that you would like to have this repository cloned to and open a console there.

    From that location run

        section up <development_token>

    replacing `<development_token>` with the token found on Development environment page for your application in [Aperture].

    This will clone your application repository and then start the virtual machine to run your proxy stack locally. For example if you ran the `section up` command from `c:\dev\` and your application was called `www.example.com` you would now have a `c:\dev\www.example.com\` directory containing your application's git repository. You should `cd` into that directory to start controlling your local proxy stack.

    From this point on, all section.io CLI commands should be run from within the directory created when you ran `section up`.

Usage
-----

The general usage pattern for the section.io CLI is:

    section command [arguments]

All section.io CLI commands should be run from the directory containing your section.io application repository. See how to **initialize the local instance of your application** under the [Installation](#installation) section of this page if you haven't done this already.

### Help

You can get a quick summary of the available section commands via:

    section --help

### section up


This will most likely be the first command you run after registering for a section.io account. On first use you will need to provide the token provided during the section.io registration process and later displayed in [Aperture] on an Instance page. For example:

    section up 36070eaf6d206a31377ba92c1c74759f9db0ad6a

This will clone your section.io application repository, launch a local virtual machine and configure it with the Proxy Stack relevant to your application.

Your application repository will be cloned to its own subdirectory under the location where you ran the command.

If your local virtual machine stops, perhaps because you restarted you computer, you can simply launch it again from the cloned application repositoty directory with the same command but omit the token, eg:

    section up

You will only need to re-specify a token if you wish to clone a different section.io application.

### section reload


After your local Proxy Stack is running and configured you will want to make changes to the files in your application repository and update the Proxy Stack to reflect those changes. You can trigger the Proxy Stack to update with:

    section reload

### section append

When you signed up for section.io you selected a particular proxy stack, however you can add additional proxies to add further functionality. For example if you started with a Varnish proxy you may later want to add ModSecurity to protect your site. You can add this in your local development environment by using `section append modsecurity:2.7.7` where `modsecurity:2.7.7` is the proxy template you want to add.

You can [view the list of available proxy templates here](/docs/proxy-list/), alternatively if you run `section append` without any parameters it will display a list of the proxies you can use.

The `append` action has a second, optional `name` parameter to allow you to set a custom name for the proxy you are adding.  If you don't specify this the name will be set to the type of proxy you are adding. eg. running `section append modsecurity:2.7.7` will set the name to `modsecurity. You can name the proxy anything you want but it must be only using alphanumeric characters.

** WARNING ** Currently, automatically pushing a new proxy into your Production hosted environment is not a supported action. Once you have tested your new proxy and you would like to deploy it, please [submit a support request](https://support.section.io/) to get it pushed live.

### section init

If you want to have a copy of your section.io application repository locally for viewing and editing but do not want to launch a local Proxy Stack for testing it you can use this command to just clone the repository. It requires a token as a parameter to identify which application, eg:

    section init 36070eaf6d206a31377ba92c1c74759f9db0ad6a

The repository will be cloned to the same directory as per `section up`.

Previous Behaviour
------------------

Previously the section.io CLI required you to run commands from the directory that the CLI was cloned into and application repositories were cloned into an `apps` directory under that location. If you have previously setup the CLI to work this way, run `section` (without parameters) once from the directory where the CLI is cloned from and it will help you transition to the new way of using the CLI.

### section push

Once you have made some changes to your section.io application configuration and verified them, the next step is to publish them in preparation for Production deployment and/or to share with your team members.

Push your local changes with a comment about the intent of your changes:

    section push "Hide version information in the Server response header"

It is important to note that this command is just a shortcut to using normal Git commands:

    git add --update
    git commit --message="your message"
    git push

### section pull

If other users have made changes, or you made changes from another computer, you should update your local application repository with these changes. This is done via:

    section pull

Just like push this is another Git shortcut for:

    git pull

### section promote

If you are confident that your application configuration changes are ready for Production deployment you can promote these changes to the Production branch of your application repository via:

    section promote

This command is useful if you work in a feature branch in git (ie not `Production`). For the purposes of example, assume the branch you were working was called `dev_feature`.

Again, this is a Git shortcut for the same operations that happen when merging a Pull Request via a Git-hosting site like GitHub or Bitbucket. It is essentially equivalent to:

    git checkout Production
    git pull
    git merge --no-ff --message="dev_feature merged to Production" dev_feature
    git push
    git checkout dev_feature

Be aware that pushing the Production branch to the section.io-hosted application repository may trigger the changes to be deployed to Production immediately.

If there are any conflicts that cannot automatically be resolved when promoting other branch changes to Production, the process will be aborted and you may need to use Git directly to resolve the issues.

### section diag

If you're having problems, you may run `section diag` to dump the diagnostic information about your working directory (section.io support staff may ask you to provide this).

As well as outputting to the screen, the run will create the file `section.debug.log` in the same directory as your `section` script.

  [GitHub for Windows]: https://windows.github.com/
  [GitHub for Mac]: https://mac.github.com/
  [SourceTree]: http://www.sourcetreeapp.com/
  [article for easily switching between Hyper-V and VirtualBox]: http://www.hanselman.com/blog/SwitchEasilyBetweenVirtualBoxAndHyperVWithABCDEditBootEntryInWindows81.aspx
  [Aperture]: https://aperture.section.io/
