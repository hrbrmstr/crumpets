% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/user-list-subscriptions.R
\name{user_list_subscriptions}
\alias{user_list_subscriptions}
\title{WIP - List the repositories watched by a user}
\usage{
user_list_subscriptions(username, api_endpoint = Sys.getenv("GITEA_BASE_URL"),
  gitea_token = Sys.getenv("GITEA_PAT"))
}
\arguments{
\item{username}{username of the user}

\item{api_endpoint}{URL prefix for your gitea server (no trailing '/')}

\item{gitea_token}{NOTE: we use \code{access_token} in the package}
}
\value{
something
}
\description{
WIP - List the repositories watched by a user
}
\note{
NOT IMPLEMENTED YET
}
\examples{
\dontrun{
}
}
