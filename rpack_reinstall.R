# Get currently installed packages
package_df <- as.data.frame(installed.packages("/Users/lpuerto/Library/R/3.x/library"))
package_clean <- package_df[
  package_df$Package != "RMariaDB" & # Needs to be build from GitHub
    package_df$Package != "DBI" & # Needs to be build from GitHub
    package_df$Package != "RcppArmadillo" & # Needs dissable Armadillo first
    package_df$Package != "igraph", # Needs to dissable suite-sparse first
] 
package_list <- as.character(package_clean$Package)
# Re-install Install packages
install.packages(package_list)
