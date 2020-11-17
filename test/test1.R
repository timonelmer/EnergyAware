# Test

cpu.info <- setup_cpu()
start.time <- proc.time()
Sys.sleep(5)
energy_evaluate(cpu.info, start.time, cores = 1)
