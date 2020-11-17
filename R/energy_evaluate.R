
# function 2: evaluate
energy_evaluate <- function(cpu.info, start.time, cores = 1){
  dur <- (proc.time()[3] - start.time[3])
  w <- as.numeric(cpu.info$tdp.pc*cores*(dur/3600))
  cat(paste0("The CPU was used for ", round(dur/60,2), " minutes and used around ",round(w,2),
             " Watt to preform the task. ",
             "That is equivalent to about \n", round(w/65,1), " hours of watching TV (65W), or \n",
             round(w/20,1), " hours of working on a laptop (20W), or \n",
             round(w/8,1), " hours of leaving an LED light on (8W)."))
}
