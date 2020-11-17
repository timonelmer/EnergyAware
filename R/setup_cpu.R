

# function 1 determine cpu
setup_cpu <- function(maxDist = 500, tdp = NULL, cpu.model = NULL, n.cores = NULL){
  cpu <- benchmarkme::get_cpu()
  if(!is.null(cpu.model)) cpu$model_name <- cpu.model
  if(!is.null(n.cores)) cpu$no_of_cores <- n.cores

  sel <- NA
  dist <- 10
  while(is.na(sel)){
  sel <- stringdist::amatch(cpu$model_name, cpu.dat$Model, maxDist = dist)
  dist <- dist + 1
  #stringdist::afind(cpu.dat$Model,cpu$model_name,method="running_cosine", q=1)
  }
  if(length(sel)==0) stop("No CPU model found. Maybe increase maxDist.")
  if(length(sel)>1) {
    cat("Multiple CPU candidates found.",
        "Which CPU do you have or is closest to yours? \n",
        paste0(sel,": ",cpu.dat[sel,"Model"],"\n"))
    sel <- as.numeric(readline("Input: "))
  }
  if(is.null(tdp)) tdp <- cpu.dat[sel,"Thermal.design.power"]
  tdp.pc <- tdp/cpu$no_of_cores
  return(list(cpu = cpu, benchmark_cpu = cpu.dat[sel,"Model"], tdp = tdp,tdp.pc = tdp.pc))
}
