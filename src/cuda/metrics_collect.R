#THis is for Altis

install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)
install.packages("rgl")
library(rgl)
install.packages("plot3D")
library("plot3D")

install.packages(c("FactoMineR", "factoextra"))
library("factoextra")

install.packages("corrplot")
library(corrplot)

#data <- read.csv(file="/u/edwardhu/Desktop/all_metrics.csv",header = TRUE, sep = ",")
#data_small <- read.csv(file="/home/ed/Desktop/SHOC/src/cuda/all_small_metrics.csv",header = TRUE, sep = ",")
#data_big <- read.csv(file="/home/ed/Desktop/SHOC/src/cuda/all_big_metrics.csv",header = TRUE, sep = ",")
data_small <- read.csv(file="/home/ed/Documents/all_big_metrics.csv",header = TRUE, sep = ",")
data_big <- read.csv(file="/home/ed/Documents/all_off.csv",header = TRUE, sep = ",")
num_bench <- 33
#data.pr <- princomp(data[1:4, 1:4], cor = FALSE, scores = TRUE)
#num_data <- subset(data, select = -c(1))

#print(data[,!apply(data, MARGIN = 2, function(x) max(x, na.rm = TRUE) == min(x, na.rm = TRUE))])
new_d_small <- data_small[,!apply(data_small, MARGIN = 2, function(x) max(x, na.rm = TRUE) == min(x, na.rm = TRUE))]
new_d_big <- data_big[,!apply(data_big, MARGIN = 2, function(y) max(y, na.rm = TRUE) == min(y, na.rm = TRUE))]
#new_d.pr <- prcomp(new_d[1:num_bench, 2:ncol(new_d)], center=TRUE, scale = TRUE)
#new_d.pr <- prcomp(new_d[1:num_bench, c("cf_issued", "cf_executed", "inst_issued", "inst_executed","inst_control","flop_count_sp_fma","inst_per_warp","inst_bit_convert","inst_integer","flop_count_sp","shared_store_transactions","inst_fp_32","flop_count_sp_add","inst_executed_shared_stores","flop_count_dp_fma","flop_count_sp_special","inst_executed_tex_ops","texture_load_requests","flop_count_dp","inst_compute_ld_st","stall_not_selected","dram_write_throughput","inst_fp_64","ldst_executed","l2_tex_read_transactions","flop_sp_efficiency","l2_read_transactions","flop_count_dp_mul","ldst_executed","shared_load_transactions","inst_executed_shared_loads","flop_count_sp_mul","tex_cache_transactions","tex_utilization","")], center=TRUE, scale = TRUE)
#final <- subset(new_d, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, global_reduction_requests, texture_load_requests))

# remove throughputs
#final <- subset(new_d, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, global_reduction_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput, l2_atomic_throughput))

#remove transactions
#final <- subset(new_d, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, global_reduction_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput, l2_atomic_throughput,                 shared_load_transactions_per_request, shared_store_transactions_per_request,local_store_transactions_per_request,gld_transactions_per_request,gst_transactions_per_request,shared_store_transactions,shared_load_transactions,local_load_transactions,local_store_transactions, gld_transactions, gst_transactions, l2_read_transactions, l2_write_transactions, dram_read_transactions, dram_write_transactions, tex_cache_transactions, atomic_transactions, atomic_transactions_per_request, l2_atomic_transactions, l2_tex_read_transactions, l2_tex_write_transactions))

#final
#final <- subset(new_d, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, pcie_total_data_received, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, global_reduction_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput, l2_atomic_throughput,                 shared_load_transactions_per_request, shared_store_transactions_per_request,local_store_transactions_per_request,gld_transactions_per_request,gst_transactions_per_request,shared_store_transactions,shared_load_transactions,local_load_transactions,local_store_transactions, gld_transactions, gst_transactions, l2_read_transactions, l2_write_transactions, dram_read_transactions, dram_write_transactions, tex_cache_transactions, atomic_transactions, atomic_transactions_per_request, l2_atomic_transactions, l2_tex_read_transactions, l2_tex_write_transactions, l2_global_load_bytes, l2_local_load_bytes, dram_read_bytes, dram_write_bytes, l2_local_global_store_bytes))

#final_small <- subset(new_d_small, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, pcie_total_data_received, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput,                 shared_load_transactions_per_request, shared_store_transactions_per_request,local_store_transactions_per_request,gld_transactions_per_request,gst_transactions_per_request,shared_store_transactions,shared_load_transactions,local_load_transactions,local_store_transactions, gld_transactions, gst_transactions, l2_read_transactions, l2_write_transactions, dram_read_transactions, dram_write_transactions, tex_cache_transactions, l2_tex_read_transactions, l2_tex_write_transactions, l2_global_load_bytes, l2_local_load_bytes, dram_read_bytes, dram_write_bytes, l2_local_global_store_bytes))
#final_big <- subset(new_d_big, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, pcie_total_data_received, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput,                 shared_load_transactions_per_request, shared_store_transactions_per_request,local_store_transactions_per_request,gld_transactions_per_request,gst_transactions_per_request,shared_store_transactions,shared_load_transactions,local_load_transactions,local_store_transactions, gld_transactions, gst_transactions, l2_read_transactions, l2_write_transactions, dram_read_transactions, dram_write_transactions, tex_cache_transactions, l2_tex_read_transactions, l2_tex_write_transactions, l2_global_load_bytes, l2_local_load_bytes, dram_read_bytes, dram_write_bytes, l2_local_global_store_bytes))
final_small <- subset(new_d_small, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, pcie_total_data_received, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, global_reduction_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput, l2_atomic_throughput,                 shared_load_transactions_per_request, shared_store_transactions_per_request,local_store_transactions_per_request,gld_transactions_per_request,gst_transactions_per_request,shared_store_transactions,shared_load_transactions,local_load_transactions,local_store_transactions, gld_transactions, gst_transactions, l2_read_transactions, l2_write_transactions, dram_read_transactions, dram_write_transactions, tex_cache_transactions, atomic_transactions, atomic_transactions_per_request, l2_atomic_transactions, l2_tex_read_transactions, l2_tex_write_transactions, l2_global_load_bytes, l2_local_load_bytes, dram_read_bytes, dram_write_bytes, l2_local_global_store_bytes, sysmem_write_transactions, sysmem_write_bytes, inst_executed_global_atomics, sysmem_read_throughput,sysmem_read_transactions,sysmem_read_utilization,sysmem_read_bytes,sysmem_read_throughput, sysmem_read_transactions, local_memory_overhead, flop_dp_efficiency))
final_big <- subset(new_d_big, select=-c(inst_misc, cf_issued, cf_executed, inst_issued, inst_executed, issue_slots, nvlink_total_data_received, nvlink_total_data_transmitted, pcie_total_data_transmitted, pcie_total_data_received, nvlink_receive_throughput, nvlink_transmit_throughput, stall_other, global_load_requests, local_load_requests, global_store_requests, local_store_requests, global_reduction_requests, texture_load_requests, gld_requested_throughput, gst_requested_throughput, gld_throughput, gst_throughput, dram_read_throughput, dram_write_throughput, tex_cache_throughput, l2_tex_read_throughput, l2_tex_write_throughput, l2_read_throughput, l2_write_throughput, sysmem_write_throughput, local_load_throughput, local_store_throughput, shared_load_throughput, shared_store_throughput, l2_atomic_throughput,                 shared_load_transactions_per_request, shared_store_transactions_per_request,local_store_transactions_per_request,gld_transactions_per_request,gst_transactions_per_request,shared_store_transactions,shared_load_transactions,local_load_transactions,local_store_transactions, gld_transactions, gst_transactions, l2_read_transactions, l2_write_transactions, dram_read_transactions, dram_write_transactions, tex_cache_transactions, atomic_transactions, atomic_transactions_per_request, l2_atomic_transactions, l2_tex_read_transactions, l2_tex_write_transactions, l2_global_load_bytes, l2_local_load_bytes, dram_read_bytes, dram_write_bytes, l2_local_global_store_bytes, sysmem_write_transactions, sysmem_write_bytes, inst_executed_global_atomics, local_memory_overhead, flop_dp_efficiency))


final_small.pr <- prcomp(final_small[1:num_bench, 2:ncol(final_small)], center=TRUE, scale = TRUE)
final_big.pr <- prcomp(final_big[1:num_bench, 2:ncol(final_big)], center=TRUE, scale = TRUE)
#print(new_d[1:num_bench, c("inst_per_warp", "ipc")])
print(ncol(final_small))
scores_small <- as.data.frame(final_small.pr$x)
scores_big <- as.data.frame(final_big.pr$x)
summary(final_big.pr)

#plot(new_d.pr$x[,1],new_d.pr$x[,2], xlab="PC1 (44.3%)", ylab = "PC2 (19%)", main = "PC1 / PC2 - plot")
#plot(new_d.pr$x[,1], new_d.pr$x[,2])
#biplot(new_d.pr)


#text(new_d.pr$x[,1],new_d.pr$x[,2],labels = data[, 1], pos = 4, offset = 0.5)


#ggbiplot(final.pr, choices = c(1,2), labels = final[, 1], var.axes = F, labels.size = 3)
par3d(windowRect = c(2309, 160, 2808, 594))
plot3d(scores_big[, 1:3], col=(2:2),size=6,type='p')
plot3d(scores_small[, 1:3], col=c(1:1),size=6,type='p',add=TRUE)

view3d( theta = -55, phi = 23, zoom=0.78)
par3d("windowRect")
first <- c(1,2,3,4,5,6,8,9,12,13,17,18,19,20,21,22,23,24,25,27,28,16,30,31,32,33)
second <- c(2,9,15)
#second <- c()
text3d(scores_small[-first, 1:3], texts=data_small[-first,1], pos = 3)
text3d(scores_big[second, 1:3], texts=data_big[second,1], pos = 3, color="red")
#text3d(scores_big[, 1:3], texts=data_big[,1], pos = 3, color="red")


#score_to_disp <- subset(scores, select=-c(1))
#label_to_disp <- data[-c(1),]
#text3d(scores[-c(1,3,4,5,10,20,22,23),1:3],texts=data[-c(1,3,4,5,10,20,22,23),1], pos=3)
#rgl.postscript("pca_shoc_small.eps", "eps")
#rgl.postscript("pca_shoc_big.pdf", "pdf")
rgl.postscript("/home/ed/Documents/altis_pca.eps", "eps")
#text3d(scores[1:10,1:3],texts=data[1:10, 1], pos=3)
#text3d(scores[,1]+2, scores[,2]+10, scores[,3]+2,texts=final[1, ])
#print(data[,1])
#scatter3D(scores[,1], scores[,2], scores[,3], phi = 1, bty = "g", pch = 10, cex = 0.5)
#text3D(scores[,1], scores[,2], scores[,3], labels = data[, 1],
       #add = TRUE, colkey = TRUE, cex = 0.7)


fviz_eig(final.pr, addlabels = TRUE, ylim = c(0, 50))

var <- get_pca_var(final.pr)
#corrplot(var$contrib, is.corr = FALSE, )

fviz_contrib(final.pr, choice = "var", axes =1, top = ncol(final), xtickslab.rt = 65)


summary(new_d.pr)

