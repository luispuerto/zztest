# How to list installed packages and save in working directory

pkg_ls_save <- function(){

  package_matrix <- installed.packages()
  
  package_df <- data.frame(package_matrix)
  
  package_list <- package_df[is.na(package_df$Priority), "Package"]
  
  packages <<- as.character(package_list)
  
  save(packages, file = "packages4.RData")

}

# This is the way to compare two folders. 

diff_pack_dirs <- function(){

  dirs4 <- list.dirs(
    path ="/Users/lpuerto/Library/R/4.x/library", 
    full.names = F, 
    recursive = F)
  dirs3 <- list.dirs(
    path ="/Users/lpuerto/Library/R/3.x/library", 
    full.names = F, 
    recursive = F)
  
  diff <- setdiff(dirs3, dirs4)
  
  return(diff)
}
