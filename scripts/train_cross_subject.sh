batch_size=10
val_batch_size=50
num_epochs=600
mse_mult=10000
rec_mult=1
cyc_mul=1
model_name="**_subj1"

cd src/

# CUDA_VISIBLE_DEVICES=4 python -W ignore \
accelerate launch --multi_gpu --num_processes 2 --gpu_ids 0,1 --main_process_port 29502 \
main.py \
--model_name $model_name --subj_list 1 2 5 7 \
--num_epochs $num_epochs --batch_size $batch_size --val_batch_size $val_batch_size \
--h_size 2048 --n_blocks 4 --pool_type max --pool_num 8192 \
--mse_mult $mse_mult --rec_mult $rec_mult --cyc_mul $cyc_mul \
--eval_interval 10 --ckpt_interval 10 \
--max_lr 1.5e-4 --num_workers 8 \
--K_image 15  --K_text 5

