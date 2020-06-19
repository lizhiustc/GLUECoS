REPO=$PWD
TASK=${1:-Sentiment_EN_ES}
MODEL=${2:-bert-base-multilingual-cased}
MODEL_TYPE=${3:-bert}
DATA_DIR=${4:-"$REPO/Data/Processed_Data"}
OUT_DIR=${5:-"$REPO/Results"}

EPOCH=5
MAX_SEQ=256

if [ $TASK == "Sentiment_EN_HI/Devanagari" ]; then
  BATCH_SIZE=32
else
  BATCH_SIZE=16
fi

python $PWD/Code/BertSequence.py \
  --data_dir $DATA_DIR/$TASK \
  --output_dir $OUT_DIR/$TASK \
  --model_type $MODEL_TYPE \
  --model_name $MODEL \
  --num_train_epochs $EPOCH \
  --train_batch_size $BATCH_SIZE \
  --max_seq_length $MAX_SEQ \
  --save_steps -1