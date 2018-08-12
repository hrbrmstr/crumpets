
# crumpets

Tools to Work with and Manage ‘gitea’

## Description

The ‘gitea’ project is a ‘GitHub’-/‘GitLab’-like web user interface to
‘git’ repositories. Methods are provided to access and administer
‘gitea’ programmatically.

## NOTE

The function skeletons were generated from the Swagger definition file
for Gitea. These will be incrementally fully formed and the ones that
are still a WIP will hard error with a `stop()` message. Function titles
prefied with `WIP` are WIP and you’re welcome to join in the fun of
building out 145 `httr` functions O\_o.

## What’s Inside The Tin

*There are at nearly 140 other functions in this package so please see
the manual pages in the online R help system.*

The following functions are implemented (i.e. are not in a WIP status):

  - `get_version`: Returns the version of the Gitea application
  - `org_list_user_orgs`: List a user’s organizations
  - `create_user_repo`: Create a repository as the owner
  - `org_get`: Get an organization
  - `repo_get`: Get a repository
  - `repo_get_archive`: Get an archive of a repository
  - `repo_get_raw_file`: Get a file from a repository
  - `repo_migrate`: Migrate a remote git repository
  - `repo_mirror_sync`: Sync a mirrored repository
  - `user_current_list_repos`: List the repos that the authenticated
    user owns or has access to
  - `user_get`: Get a user
  - `user_get_current`: Get the authenticated user
  - `user_list_repos`: List the repos owned by the given user

## Installation

``` r
devtools::install_git("git://gitlab.com/hrbrmstr/crumpets")
```

## Usage

``` r
library(crumpets)

# current verison
packageVersion("crumpets")
```

    ## [1] '0.1.0'

``` r
get_version()
```

    ## [1] "1.4.2"
