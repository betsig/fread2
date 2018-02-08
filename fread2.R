require(tools)
require(data.table)
fread2 <- function(file, ...){
    # check platform for windows/unix specific decompression
    operatingSystem <- .Platform$OS.type
    if(operatingSystem == "unix"){
        ungzip <- "zcat < "
    }else{ #in windows
        ungzip <- "gzip -dc "
    }
    
    #check if file is gzipped
    if(tools::file_ext(file) == "gz"){
        readin <- data.table::fread(paste0(ungzip, file), ...)
    }else{
        readin <- data.table::fread(file, ...)
    }
    return(readin)
}