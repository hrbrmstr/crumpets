#' Get a file from a repository
#'
#' @md
#' @param owner owner of the repo
#' @param repo name of the repo
#' @param filepath filepath of the file to get
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return if MIME type was intuited and [httr::content()] can decode it, then a decoded
#'         object, otherwise a raw vector
#' @export
#' @examples \dontrun{
#' repo_get_raw_file("hrbrmstr", "ggalt", "/man/figures/coordproj01.png")
#' repo_get_raw_file("hrbrmstr", "securitytxt", "/R/RcppExports.R")
#' }
repo_get_raw_file <- function(owner, repo, filepath, api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                              gitea_token = Sys.getenv("GITEA_PAT")) {

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/repos/{owner}/{repo}/raw/{filepath}"))
  glue::glue_data(
    list(
      owner=owner,
      repo=repo,
      filepath=filepath
    ),
    gitea_url
  ) -> gitea_url

  httr::VERB(
    verb = "GET",
    url = gitea_url,
    query = list(
      `owner` = `owner`,
      `repo` = `repo`,
      `filepath` = `filepath`,
      access_token = gitea_token
    ),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res)

  invisible(out)
}
