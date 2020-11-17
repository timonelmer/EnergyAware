

# function 1 determine cpu
setup_cpu <- function(maxDist = 500){
  #cpu.dat <- read.csv("cpu_data.csv")
  cpu <- benchmarkme::get_cpu()
  sel <- stringdist::amatch(cpu$model_name, cpu.dat$Model, maxDist = maxDist)
  if(length(sel)==0) stop("No CPU model found. Maybe increase maxDist.")
  if(length(sel)>1) {
    cat("Multiple CPU candidates found.",
        "Which CPU do you have or is closest to yours? \n",
        paste0(sel,": ",cpu.dat[sel,"Model"],"\n"))
    sel <- as.numeric(readline("Input: "))
  }
  tdp <- cpu.dat[sel,"Thermal.design.power"]
  tdp.pc <- tdp/cpu$no_of_cores
  return(list(cpu = cpu, benchmark_cpu = cpu.dat[sel,"Model"], tdp = tdp,tdp.pc = tdp.pc))
}
