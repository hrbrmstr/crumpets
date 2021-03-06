% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/repo-get-branch.R
\name{repo_get_branch}
\alias{repo_get_branch}
\title{WIP - List a repository's branches}
\usage{
repo_get_branch(owner, repo, branch,
  api_endpoint = Sys.getenv("GITEA_BASE_URL"),
  gitea_token = Sys.getenv("GITEA_PAT"))
}
\arguments{
\item{owner}{owner of the repo}

\item{repo}{name of the repo}

\item{branch}{branch to get}

\item{api_endpoint}{URL prefix for your gitea server (no trailing '/')}

\item{gitea_token}{NOTE: we use \code{access_token} in the package}
}
\value{
something
}
\description{
WIP - List a repository's branches
}
\note{
NOT IMPLEMENTED YET
}
\examples{
\dontrun{
}
}
