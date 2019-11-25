XLNET_DIR=/media/data/nlp_models/chinese_xlnet_base_L-12_H-768_A-12
# MODEL_DIR=/media/data/checkpoints/xlnet_output
MODEL_DIR=/media/data/checkpoints/xlnet_output_base
DATA_DIR=./tfrecords
RAW_DIR=/media/data/CCF_data/car_forum_data
TPU_NAME=v2-xlnet
TPU_ZONE=us-central1-b

python -u run_classifier.py \
	--spiece_model_file=./spiece.model \
	--model_config_path=${XLNET_DIR}/xlnet_config.json \
	--init_checkpoint=${XLNET_DIR}/xlnet_model.ckpt \
	--task_name=carforum \
	--do_train=False \
	--do_eval=False \
	--do_predict=True \
	--eval_all_ckpt=False \
	--predict_dir=$MODEL_DIR \
	--uncased=False \
	--data_dir=${RAW_DIR} \
	--eval_split=test \
	--output_dir=${DATA_DIR} \
	--model_dir=${MODEL_DIR} \
	--train_batch_size=6 \
	--eval_batch_size=6 \
	--num_hosts=1 \
	--num_core_per_host=1 \
	--num_train_epochs=3 \
	--max_seq_length=256 \
	--learning_rate=2e-5 \
	--predict_threshold=0.1 \
	--save_steps=5000 \
	--use_tpu=False \
	--tpu=${TPU_NAME} \
	--tpu_zone=${TPU_ZONE}