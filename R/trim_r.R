#' Remove html and pdf files from R installation
#'
#' @param build_path path to the copied R installation

#'
#' @return nothing
#' @export
#'
trim_r <- function(build_path){
  
  elements_to_remove <- c("help", "doc", "tests", "html", "include", "unitTests", file.path("libs", "*dSYM"))

  r_lib_path <- file.path(build_path,
                           "app",
                           "r_lang", 
                           "Library",
                           "Frameworks",
                           "R.framework",
                           "Resources",
                           "library")
  
  lapply(list.dirs(r_lib_path, full.names = TRUE, recursive = TRUE),
         function(x) {
           unlink(file.path(x, elements_to_remove), force = TRUE, recursive = TRUE)
         })
}
