#' Create a repository as the owner
#'
#' @md
#' @param name Repository name. Mandatory. A good repository name is composed of short, memorable, and unique keywords.
#' @param description Repository description. Optional.
#' @param gitignores Use a `.gitignore` template. Supply a valid name you see in the dropdown. Case matters. Optional.
#' @param readme use the `Default` empty `README.md`
#' @param license Use a content license template. Supply a valid name you see in the dropdown. Case matters. Optional.
#' @param private logical. Defaults to `FALSE`
#' @param auto_init auto-initialize the repo? Default is `TRUE`
#' @param api_endpoint URL prefix for your gitea server (no trailing '/')
#' @param gitea_token NOTE: we use `access_token` in the package
#' @return list (invisibly) with the status result of the API
#' @export
#' @examples \dontrun{
#' }
create_user_repo <- function(name,
                                     description=NULL,
                                     gitignores=NULL,
                                     readme = "Default",
                                     license=NULL,
                                     private = FALSE,
                                     auto_init = TRUE,
                                     api_endpoint = Sys.getenv("GITEA_BASE_URL"),
                                     gitea_token = Sys.getenv("GITEA_PAT")) {

  api_endpoint <- sub("/$", "", api_endpoint)

  gitea_url <- file.path(api_endpoint, "api/v1", sub("^/", "", "/user/repos"))

  httr::VERB(
    verb = "POST",
    url = gitea_url,
    body = list(
      name = name,
      description = description,
      gitignores = gitignores,
      readme = readme,
      license = license,
      private = private,
      auto_init = auto_init
    ),
    query = list(access_token = gitea_token),
    encode = "json",
    httr::user_agent("crumpets r package <https://gitlab.com/hrbrmstr/crumpets")
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text")
  out <- jsonlite::fromJSON(out)

  invisible(out)
}
